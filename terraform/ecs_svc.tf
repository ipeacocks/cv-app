resource "aws_ecs_service" "cv-nginx" {
  name            = "cv-nginx"
  cluster         = "${aws_ecs_cluster.cv-cluster.id}"
  task_definition = "${aws_ecs_task_definition.cv-nginx.arn}"
  depends_on      = ["aws_ecs_service.cv-uwsgi"]

  desired_count = 2
  launch_type   = "FARGATE"

  service_registries {
    registry_arn = "${aws_service_discovery_service.cv-nginx.arn}"
  }

  network_configuration {
    security_groups = ["${aws_security_group.cv-nginx.id}"]
    subnets         = ["${aws_subnet.private.*.id}"]
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.cv-nginx.id}"
    container_name   = "cv-nginx"
    container_port   = "${var.cv_nginx_port}"
  }

  depends_on = ["aws_alb.cv-nginx"]
}

resource "aws_ecs_service" "cv-mariadb" {
  name            = "cv-mariadb"
  cluster         = "${aws_ecs_cluster.cv-cluster.id}"
  task_definition = "${aws_ecs_task_definition.cv-mariadb.arn}"

  desired_count = 1
  launch_type   = "FARGATE"

  service_registries {
    registry_arn = "${aws_service_discovery_service.cv-mariadb.arn}"
  }

  network_configuration {
    security_groups = ["${aws_security_group.cv-mariadb.id}"]
    subnets         = ["${aws_subnet.private.*.id}"]
  }
}

resource "aws_ecs_service" "cv-uwsgi" {
  name            = "cv-uwsgi"
  cluster         = "${aws_ecs_cluster.cv-cluster.id}"
  task_definition = "${aws_ecs_task_definition.cv-uwsgi.arn}"
  depends_on      = ["aws_ecs_service.cv-mariadb"]

  # desired_count   = "${var.app_count}"
  desired_count = 1
  launch_type   = "FARGATE"

  service_registries {
    registry_arn = "${aws_service_discovery_service.cv-uwsgi.arn}"
  }

  network_configuration {
    security_groups = ["${aws_security_group.cv-uwsgi.id}"]
    subnets         = ["${aws_subnet.private.*.id}"]
  }
}
