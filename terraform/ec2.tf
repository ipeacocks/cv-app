resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "${var.public-key}"
}

# One bastion is enough for testing
resource "aws_instance" "bastion" {
  ami = "${var.ami_image}"

  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.public.0.id}"
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  key_name               = "${aws_key_pair.my-key.key_name}"

  tags {
    Name      = "bastion"
    Terraform = 1
  }
}

resource "aws_eip" "bastion" {
  instance   = "${aws_instance.bastion.id}"
  depends_on = ["aws_instance.bastion"]

  tags {
    Name      = "bastion"
    Terraform = 1
  }
}
