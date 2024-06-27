data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "roboshop_dev_mongodb_sg_id"
}

data "aws_ssm_parameter" "database_cidr_subnets" {
  name = "roboshop_dev_database_cidr_subnets"
}

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