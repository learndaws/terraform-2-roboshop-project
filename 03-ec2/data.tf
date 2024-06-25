data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "roboshop_dev_mongodb_sg_id"
}

data "aws_ssm_parameter" "database_cidr_subnets" {
  name = "roboshop_dev_database_cidr_subnets"
}