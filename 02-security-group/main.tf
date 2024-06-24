module "mongodb" {
    #source = "../../terraform-2-sg-developer"
    source = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
    sg_name = "roboshop_mongodb_sg_group"
    description = "roboshop_mongodb_allow-specific"
    vpc_id = data.aws_ssm_parameter.roboshop_dev_vpc_id.value             
    sg_function_tags = var.mongodb_sg_function_tags
    #ingress_rules = var.mongodb_ingress_rules
}

module "catalogue" {
    #source = "../../terraform-2-sg-developer"
    source = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
    sg_name = "roboshop_catalogue_sg_group"
    description = "roboshop_catalogue_allow-specific"
    vpc_id = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
    sg_function_tags = var.catalogue_sg_function_tags
    #ingress_rules = var.catalogue_ingress_rules
}

module "user" {
    #source = "../../terraform-2-sg-developer"
    source = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
    sg_name = "roboshop_user_sg_group"
    description = "roboshop_user_allow-specific"
    vpc_id = data.aws_ssm_parameter.roboshop_dev_vpc_id.value
    sg_function_tags = var.user_sg_function_tags
    #ingress_rules = var.user_ingress_rules
}

resource "aws_security_group_rule" "catalogue_to_mongodb" {
  source_security_group_id = module.catalogue.sg_id                            
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}

resource "aws_security_group_rule" "user_to_mongodb" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}