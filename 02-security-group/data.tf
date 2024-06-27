data "aws_ssm_parameter" "roboshop_dev_vpc_id" {
  name = "roboshop_dev_vpc_id"
}

data "aws_vpc" "default" {
  default = true
}