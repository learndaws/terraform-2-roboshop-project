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

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "roboshop_dev_vpn_sg_id"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default_vpc_us_east_1a_subnet" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = "us-east-1a"
}

output "delete" {
  value = data.aws_subnet.default_vpc_us_east_1a_subnet
}

