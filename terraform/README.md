## Terraform

These templates create:
* VPC
* 2 subnets: private and public
* 1 bastion (ssh) host inside private subnet
* ECS Fargate cluster
* 3 tasks/services for ECS: `cv-nginx`, `cv-uwsgi` (python flask app), `cv-mariadb`
* ALB balancer for cv-nginx containers

Services find each other using AWS service discovering for ECS.

Before using these templates, create S3 bucket/DynamoDB lock:
```
$ aws s3api create-bucket \
      --bucket my-tf-state \
      --region us-east-1

$ aws s3api put-bucket-versioning \
      --bucket my-tf-state \
      --versioning-configuration Status=Enabled
```
```
$ aws dynamodb create-table \
      --region us-east-1 \
      --table-name my-inf-tflock \
      --attribute-definitions AttributeName=LockID,AttributeType=S \
      --key-schema AttributeName=LockID,KeyType=HASH \
      --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```
`aws-cli` needs to be configured and installed.    
Now you are ready to start:
```
$ terraform init
$ terraform plan
$ terraform apply
```
Main variables are described in `vars.tf`. After applying terraform will output 2 addresses like:
```
Outputs:

alb_hostname = cv-app-1335227840.us-east-1.elb.amazonaws.com
bastion-eip = 18.214.147.223

```
First one is web link for the app, second one - address to ssh host to newly created VPC.
