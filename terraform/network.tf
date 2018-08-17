# Fetch AZs in the current region
data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block = "172.17.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name      = "vpc"
    Terraform = 1
  }
}

# Create var.az_count private subnets, each in a different AZ
resource "aws_subnet" "private" {
  count             = "${var.az_count}"
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags {
    Name      = "private-${count.index}"
    Terraform = 1
  }
}

# Create var.az_count public subnets, each in a different AZ
resource "aws_subnet" "public" {
  count                   = "${var.az_count}"
  cidr_block              = "${cidrsubnet(aws_vpc.vpc.cidr_block, 8, var.az_count + count.index)}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  map_public_ip_on_launch = true

  tags {
    Name      = "public-${count.index}"
    Terraform = 1
  }
}

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name      = "internet-gw"
    Terraform = 1
  }
}

resource "aws_route" "route-to-internet-gw" {
  route_table_id         = "${aws_vpc.vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet-gw.id}"
}

resource "aws_eip" "nat-gw" {
  count      = "${var.az_count}"
  vpc        = true
  depends_on = ["aws_internet_gateway.internet-gw"]

  tags {
    Name      = "nat-gw-${count.index}"
    Terraform = 1
  }
}

resource "aws_nat_gateway" "nat-gw" {
  count         = "${var.az_count}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
  allocation_id = "${element(aws_eip.nat-gw.*.id, count.index)}"

  tags {
    Name      = "nat-gw-${count.index}"
    Terraform = 1
  }
}

resource "aws_route_table" "private" {
  count  = "${var.az_count}"
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.nat-gw.*.id, count.index)}"
  }

  tags {
    Name      = "private-${count.index}"
    Terraform = 1
  }
}

resource "aws_route_table_association" "private-subnet-associations" {
  count          = "${var.az_count}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
