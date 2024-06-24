module "mongodb" {
    #source = "../../terraform-2-sg-developer"
    source = "git::https://github.com/learndaws/terraform-2-sg-developer.git"
    sg_name = "roboshop_mongodb_sg_group"
    description = "roboshop_mongodb_allow-specific"
    vpc_id = data.aws_ssm_parameter.robosho_vpc_id.value
    sg_function_tags = var.mongodb_sg_function_tags
    #ingress_rules = var.mongodb_ingress_rules
}