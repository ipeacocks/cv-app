### Discovering

resource "aws_service_discovery_private_dns_namespace" "my-zone" {
  name        = "my-zone"
  description = "my zone"
  vpc         = "${aws_vpc.vpc.id}"
}

resource "aws_service_discovery_service" "cv-nginx" {
  name = "cv-nginx"

  dns_config {
    namespace_id = "${aws_service_discovery_private_dns_namespace.my-zone.id}"

    dns_records {
      ttl  = 60
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "cv-mariadb" {
  name = "cv-mariadb"

  dns_config {
    namespace_id = "${aws_service_discovery_private_dns_namespace.my-zone.id}"

    dns_records {
      ttl  = 60
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}

resource "aws_service_discovery_service" "cv-uwsgi" {
  name = "cv-uwsgi"

  dns_config {
    namespace_id = "${aws_service_discovery_private_dns_namespace.my-zone.id}"

    dns_records {
      ttl  = 60
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 1
  }
}
