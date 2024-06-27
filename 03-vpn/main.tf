module "open-vpn" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = var.name
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  subnet_id              = data.aws_subnet.default_vpc_us_east_1a_subnet.id

  user_data = file("vpn.sh")

  tags = merge(var.common_tags, var.open-vpn_function_tags)
}