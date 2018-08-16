### ECS Cluster

resource "aws_ecs_cluster" "cv-cluster" {
  name = "cv-cluster"
}

### ECS Tasks

resource "aws_ecs_task_definition" "cv-nginx" {
  family                   = "cv-nginx"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"

  container_definitions = <<DEFINITION
[
  {
    "cpu": ${var.fargate_cpu},
    "image": "${var.cv_nginx_image}",
    "memory": ${var.fargate_memory},
    "name": "cv-nginx",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.cv_nginx_port},
        "hostPort": ${var.cv_nginx_port}
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_task_definition" "cv-mariadb" {
  family                   = "cv-mariadb"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"

  container_definitions = <<DEFINITION
[
  {
    "cpu": ${var.fargate_cpu},
    "image": "${var.cv_mariadb_image}",
    "memory": ${var.fargate_memory},
    "name": "cv-mariadb",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.cv_mariadb_port},
        "hostPort": ${var.cv_mariadb_port}
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_task_definition" "cv-uwsgi" {
  family                   = "cv-uwsgi"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"

  container_definitions = <<DEFINITION
[
  {
    "cpu": ${var.fargate_cpu},
    "image": "${var.cv_uwsgi_image}",
    "memory": ${var.fargate_memory},
    "name": "cv-uwsgi",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.cv_uwsgi_port},
        "hostPort": ${var.cv_uwsgi_port}
      }
    ]
  }
]
DEFINITION
}
