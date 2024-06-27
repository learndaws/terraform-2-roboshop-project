variable "name" {
  type    = string
  default = "roboshop-dev-mongodb"

}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "Roboshop"
    Environment = "Dev"
    Terraform   = "True"
  }
}

variable "mongodb_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_mongodb_ec2"
  }
}