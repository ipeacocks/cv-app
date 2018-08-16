# S3 bucket and DynamoDB table need to be created before
terraform {
  backend "s3" {
    bucket         = "my-tf-state"
    dynamodb_table = "my-inf-tflock"
    key            = "my-inf.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  version                 = "~> 1.31"
  shared_credentials_file = "${var.credentials}"
  region                  = "${var.aws_region}"
}
