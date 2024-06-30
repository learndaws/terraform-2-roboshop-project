module "web" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-web"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.web_sg_id.value]
  subnet_id              = local.public_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-web" })
}

module "catalogue" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-catalogue"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-catalogue" })
}

module "cart" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-cart"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.cart_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-cart" })
}

module "user" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-user"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.user_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-user" })
}

module "shipping" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-shipping"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.shipping_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-shipping" })
}

module "payments" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-payments"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.payments_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-payments" })
}

module "mongodb" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-mongodb"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-mongodb" })
}

module "redis" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-redis"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-redis" })
}

module "mysql" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-mysql"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mysql_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-mysql" })
}

module "rabbit_mq" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.name}-rabbit_mq"
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.rabbit_mq_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-rabbit_mq" })
}


#Ansible Server and DNS Records creation

module "ansible" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  ami                    = data.aws_ami.centos8.id
  name                   = "${var.name}-ansible"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  subnet_id              = data.aws_subnet.default_vpc_us_east_1a_subnet.id #  default VPC 1a subnet
  user_data              = file("ec2-provision.sh")
  tags                   = merge(var.common_tags, { "Name" = "${var.function_tags["Name"]}-ansible" })
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name

  records = [
    {
      name    = "mongodb"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mongodb.private_ip}",
      ]
    },
    {
      name    = "redis"
      type    = "A"
      ttl     = 1
      records = [
        "${module.redis.private_ip}",
      ]
    },
    {
      name    = "mysql"
      type    = "A"
      ttl     = 1
      records = [
        "${module.mysql.private_ip}",
      ]
    },
    {
      name    = "rabbit_mq"
      type    = "A"
      ttl     = 1
      records = [
        "${module.rabbit_mq.private_ip}",
      ]
    },
    {
      name    = "catalogue"
      type    = "A"
      ttl     = 1
      records = [
        "${module.catalogue.private_ip}",
      ]
    },
    {
      name    = "user"
      type    = "A"
      ttl     = 1
      records = [
        "${module.user.private_ip}",
      ]
    },
    {
      name    = "cart"
      type    = "A"
      ttl     = 1
      records = [
        "${module.cart.private_ip}",
      ]
    },
    {
      name    = "shipping"
      type    = "A"
      ttl     = 1
      records = [
        "${module.shipping.private_ip}",
      ]
    },
    {
      name    = "payments"
      type    = "A"
      ttl     = 1
      records = [
        "${module.payments.private_ip}",
      ]
    },
    {
      name    = "web"
      type    = "A"
      ttl     = 1
      records = [
        "${module.web.private_ip}",
      ]
    },
  ]
}

