### Security

# SG for bastion EC2 (ssh host)
resource "aws_security_group" "bastion" {
  name   = "bastion"
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "bastion"
    Terraform = 1
  }
}

# ALB Security group
# This is the group you need to edit if you want to restrict access to your application
resource "aws_security_group" "alb-cv-app" {
  name        = "alb-cv-app"
  description = "allow full inbound access to ALB"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "alb-cv-app"
    Terraform = 1
  }
}

# SG for ECS tasks 
# Traffic to the ECS Cluster should only come from the ALB
resource "aws_security_group" "cv-nginx" {
  name        = "cv-nginx"
  description = "allow inbound access from the ALB only"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    protocol        = "tcp"
    from_port       = "${var.cv_nginx_port}"
    to_port         = "${var.cv_nginx_port}"
    security_groups = ["${aws_security_group.alb-cv-app.id}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "cv-nginx"
    Terraform = 1
  }
}

resource "aws_security_group" "cv-mariadb" {
  name        = "cv-mariadb"
  description = "allow inbound access from the UWSGI server"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    protocol        = "tcp"
    from_port       = "${var.cv_mariadb_port}"
    to_port         = "${var.cv_mariadb_port}"
    security_groups = ["${aws_security_group.cv-uwsgi.id}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "cv-mariadb"
    Terraform = 1
  }
}

resource "aws_security_group" "cv-uwsgi" {
  name        = "cv-uwsgi"
  description = "allow inbound access from the NginX only"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    protocol        = "tcp"
    from_port       = "${var.cv_uwsgi_port}"
    to_port         = "${var.cv_uwsgi_port}"
    security_groups = ["${aws_security_group.cv-nginx.id}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name      = "cv-uwsgi"
    Terraform = 1
  }
}
