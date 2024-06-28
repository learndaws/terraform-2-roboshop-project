module "vpn" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_vpn_sg_group"
  description      = "roboshop_vpn_allow-specific"
  vpc_id           = data.aws_vpc.default.id
  sg_function_tags = var.vpn_sg_function_tags
  #ingress_rules = var.vpn_ingress_rules
}

module "web" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_web_sg_group"
  description      = "roboshop_web_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.web_sg_function_tags
  #ingress_rules = var.web_ingress_rules
}

module "catalogue" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_catalogue_sg_group"
  description      = "roboshop_catalogue_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.catalogue_sg_function_tags
  #ingress_rules = var.catalogue_ingress_rules
}

module "cart" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_cart_sg_group"
  description      = "roboshop_cart_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.cart_sg_function_tags
  #ingress_rules = var.cart_ingress_rules
}

module "user" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_user_sg_group"
  description      = "roboshop_user_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.user_sg_function_tags
  #ingress_rules = var.user_ingress_rules
}

module "shipping" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_shipping_sg_group"
  description      = "roboshop_shipping_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.shipping_sg_function_tags
  #ingress_rules = var.shipping_ingress_rules
}

module "payments" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_payments_sg_group"
  description      = "roboshop_payments_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.payments_sg_function_tags
  #ingress_rules = var.payments_ingress_rules
}

module "mongodb" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_mongodb_sg_group"
  description      = "roboshop_mongodb_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.mongodb_sg_function_tags
  #ingress_rules = var.mongodb_ingress_rules
}

module "redis" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_redis_sg_group"
  description      = "roboshop_redis_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.redis_sg_function_tags
  #ingress_rules = var.redis_ingress_rules
}

module "mysql" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_mysql_sg_group"
  description      = "roboshop_mysql_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.mysql_sg_function_tags
  #ingress_rules = var.mysql_ingress_rules
}

module "rabbit_mq" {
  #source = "../../terraform-2-sg-developer"
  source           = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
  sg_name          = "roboshop_rabbit_mq_sg_group"
  description      = "roboshop_rabbit_mq_allow-specific"
  vpc_id           = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
  sg_function_tags = var.rabbit_mq_sg_function_tags
  #ingress_rules = var.rabbit_mq_ingress_rules
}

resource "aws_security_group_rule" "Internet_to_vpn" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_web" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}

resource "aws_security_group_rule" "internet_web" {
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.web.sg_id
}

resource "aws_security_group_rule" "vpn_catalogue" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "web_catalogue" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "cart_catalogue" {
  source_security_group_id = module.cart.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "vpn_cart" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "web_cart" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "shipping_cart" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "payments_cart" {
  source_security_group_id = module.payments.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "vpn_user" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "web_user" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "payments_user" {
  source_security_group_id = module.payments.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "vpn_shipping" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "web_shipping" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "vpn_payments" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.payments.sg_id
}

resource "aws_security_group_rule" "web_payments" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.payments.sg_id
}

resource "aws_security_group_rule" "catalogue_to_mongodb" {
  source_security_group_id = module.catalogue.sg_id
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
}

resource "aws_security_group_rule" "user_to_mongodb" {
  source_security_group_id = module.user.sg_id
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
}

resource "aws_security_group_rule" "vpn_to_mongodb" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mongodb.sg_id
}

resource "aws_security_group_rule" "user_to_redis" {
  source_security_group_id = module.user.sg_id
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
}

resource "aws_security_group_rule" "cart_to_redis" {
  source_security_group_id = module.cart.sg_id
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
}

resource "aws_security_group_rule" "vpn_mysql" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}

resource "aws_security_group_rule" "shipping_mysql" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}

resource "aws_security_group_rule" "vpn_rabbit_mq" {
  source_security_group_id = module.vpn.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.rabbit_mq.sg_id
}

resource "aws_security_group_rule" "payments_rabbit_mq" {
  source_security_group_id = module.payments.sg_id
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  security_group_id        = module.rabbit_mq.sg_id
}



