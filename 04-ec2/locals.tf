locals {
  public_subnet_id   = element(split(",", data.aws_ssm_parameter.public_cidr_subnets.value), 0)
  private_subnet_id  = element(split(",", data.aws_ssm_parameter.private_cidr_subnets.value), 0)
  database_subnet_id = element(split(",", data.aws_ssm_parameter.database_cidr_subnets.value), 0)
}