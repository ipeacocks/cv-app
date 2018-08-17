resource "aws_alb" "cv-app" {
  name            = "cv-app"
  subnets         = ["${aws_subnet.public.*.id}"]
  security_groups = ["${aws_security_group.alb-cv-app.id}"]

  tags {
    Terraform = 1
  }
}

resource "aws_alb_target_group" "cv-nginx" {
  name        = "cv-nginx"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.vpc.id}"
  target_type = "ip"
  depends_on  = ["aws_alb.cv-app"]

  tags {
    Terraform = 1
  }
}

resource "aws_alb_listener" "cv-nginx" {
  load_balancer_arn = "${aws_alb.cv-app.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.cv-nginx.id}"
    type             = "forward"
  }
}
