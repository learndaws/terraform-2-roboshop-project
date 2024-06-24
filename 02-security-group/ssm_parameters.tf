resource "aws_ssm_parameter" "sg_id" {
  name  = "roboshop_dev_sg_id"
  type  = "String"
  value = module.mongodb.sg_id
}