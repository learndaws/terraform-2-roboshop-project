resource "aws_ssm_parameter" "vpc_id" {
  name  = "roboshop_dev_vpc_id"
  type  = "String"
  value = module.vpc_project.vpc_id
}

resource "aws_ssm_parameter" "public_cidr_subnets" {
  name  = "roboshop_dev_public_cidr_subnets"
  type  = "StringList"
  value = join(",", module.vpc_project.public_subnet_ids)
}

resource "aws_ssm_parameter" "private_cidr_subnets" {
  name  = "roboshop_dev_private_cidr_subnets"
  type  = "StringList"
  value = join(",", module.vpc_project.private_subnet_ids)
}

resource "aws_ssm_parameter" "database_cidr_subnets" {
  name  = "roboshop_dev_database_cidr_subnets"
  type  = "StringList"
  value = join(",", module.vpc_project.database_subnet_ids)
}