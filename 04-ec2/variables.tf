variable "name" {
  type    = string
  default = "roboshop-dev"

}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "Roboshop"
    Environment = "Dev"
    Terraform   = "True"
  }
}

variable "function_tags" {
  type = map(string)
  default = {
    Name = "Roboshop-dev"
  }
}

variable "zone_name" {
  default = "hellodns.xyz"
}