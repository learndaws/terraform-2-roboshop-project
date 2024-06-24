resource "aws_ssm_parameter" "mongodb_sg_id" {
  name  = "roboshop_dev_mongodb_sg_id"
  type  = "String"
  value = module.mongodb.sg_id
}

resource "aws_ssm_parameter" "catalogue_sg_id" {
  name  = "roboshop_dev_catalogue_sg_id"
  type  = "String"
  value = module.catalogue.sg_id
}

resource "aws_ssm_parameter" "user_sg_id" {
  name  = "roboshop_dev_user_sg_id"
  type  = "String"
  value = module.user.sg_id
}