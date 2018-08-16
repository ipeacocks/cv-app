variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "credentials" {
  default     = "~/.aws/credentials"
  description = "where your access and secret_key are stored, you create the file when you run the aws config"
}

###### IMAGES

# Change it if you gonna use other region
variable "ami_image" {
  description = "AMI image for EC2"
  default     = "ami-b70554c8"
}

variable "cv_nginx_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "ipeacocks/cv-nginx:latest"
}

variable "cv_mariadb_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "ipeacocks/cv-mariadb:latest"
}

variable "cv_uwsgi_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "ipeacocks/cv-uwsgi:latest"
}

###### PORTS

variable "cv_nginx_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "cv_mariadb_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3306
}

variable "cv_uwsgi_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 5000
}

######

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

# replace it on your own
variable "public-key" {
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDB6n9K78fB+4HzwqgwLQkd94bawaMdxF6LHqm4eeBWcvVKdE4EJwTGNA6QgfklJevZZFx/BU7xKn0I1iU86Z8Jwmn0dSaohFpcT+ckDoFfugbkQ28nO80rhOZK02m3U/HN7DjJePgLHkpMt6B527DFKrfNvFPZ9h/0EofH/4V2Xj6YFeaomxXtg31hZ7qcKSrI54YmtzFhUau0H6ndr45jVgzTqxYiIk/ioARt/hsmAzglym0/OE2qsGgpf+0gXZo7sLjvuaMhLuM7RqryOqEddqLeZnksJ6hippNUoC9esgJSBWrUSCTRenjurPDtqK2ZN7BS55Z3LG0eOsonJqBB my-email@example.com"
  description = "ssh key to use in the EC2 machines"
}
