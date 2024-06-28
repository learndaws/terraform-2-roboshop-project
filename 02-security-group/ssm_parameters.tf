resource "aws_ssm_parameter" "vpn_sg_id" {
  name  = "roboshop_dev_vpn_sg_id"
  type  = "String"
  value = module.vpn.sg_id
}

resource "aws_ssm_parameter" "web_sg_id" {
  name  = "roboshop_dev_web_sg_id"
  type  = "String"
  value = module.web.sg_id
}

resource "aws_ssm_parameter" "catalogue_sg_id" {
  name  = "roboshop_dev_catalogue_sg_id"
  type  = "String"
  value = module.catalogue.sg_id
}

resource "aws_ssm_parameter" "cart_sg_id" {
  name  = "roboshop_dev_cart_sg_id"
  type  = "String"
  value = module.cart.sg_id
}

resource "aws_ssm_parameter" "user_sg_id" {
  name  = "roboshop_dev_user_sg_id"
  type  = "String"
  value = module.user.sg_id
}

resource "aws_ssm_parameter" "shipping_sg_id" {
  name  = "roboshop_dev_shipping_sg_id"
  type  = "String"
  value = module.shipping.sg_id
}

resource "aws_ssm_parameter" "payments_sg_id" {
  name  = "roboshop_dev_payments_sg_id"
  type  = "String"
  value = module.payments.sg_id
}

resource "aws_ssm_parameter" "mongodb_sg_id" {
  name  = "roboshop_dev_mongodb_sg_id"
  type  = "String"
  value = module.mongodb.sg_id
}

resource "aws_ssm_parameter" "redis_sg_id" {
  name  = "roboshop_dev_redis_sg_id"
  type  = "String"
  value = module.redis.sg_id
}

resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "roboshop_dev_mysql_sg_id"
  type  = "String"
  value = module.mysql.sg_id
}

resource "aws_ssm_parameter" "rabbit_mq_sg_id" {
  name  = "roboshop_dev_rabbit_mq_sg_id"
  type  = "String"
  value = module.rabbit_mq.sg_id
}






