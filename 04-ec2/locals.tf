locals {
  database_subnet_id = element(split(",", data.aws_ssm_parameter.database_cidr_subnets.value), 0)
}