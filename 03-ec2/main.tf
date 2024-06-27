module "mongodb" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = var.name
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(var.common_tags, var.mongodb_function_tags)
}