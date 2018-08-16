output "alb_hostname" {
  value = "${aws_alb.cv-app.dns_name}"
}

output "bastion-eip" {
  value = "${aws_eip.bastion.public_ip}"
}
