data "aws_ssm_parameter" "public_cidr_subnets" {
  name = "roboshop_dev_public_cidr_subnets"
}

data "aws_ssm_parameter" "private_cidr_subnets" {
  name = "roboshop_dev_private_cidr_subnets"
}

data "aws_ssm_parameter" "database_cidr_subnets" {
  name = "roboshop_dev_database_cidr_subnets"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "roboshop_dev_vpn_sg_id"
}

data "aws_ssm_parameter" "web_sg_id" {
  name = "roboshop_dev_web_sg_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "roboshop_dev_catalogue_sg_id"
}

data "aws_ssm_parameter" "cart_sg_id" {
  name = "roboshop_dev_cart_sg_id"
}

data "aws_ssm_parameter" "user_sg_id" {
  name = "roboshop_dev_user_sg_id"
}

data "aws_ssm_parameter" "shipping_sg_id" {
  name = "roboshop_dev_shipping_sg_id"
}

data "aws_ssm_parameter" "payments_sg_id" {
  name = "roboshop_dev_payments_sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "roboshop_dev_mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "roboshop_dev_redis_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "roboshop_dev_mysql_sg_id"
}

data "aws_ssm_parameter" "rabbit_mq_sg_id" {
  name = "roboshop_dev_rabbit_mq_sg_id"
}


## Centos8 VPC ID
data "aws_ami" "centos8" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default_vpc_us_east_1a_subnet" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "us-east-1a"
}