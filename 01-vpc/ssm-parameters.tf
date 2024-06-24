resource "aws_ssm_parameter" "vpc_id" {
  name  = "roboshop_dev_vpc_id"
  type  = "String"
  value = module.vpc_project.vpc_id
}