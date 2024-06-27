variable "name" {
  type    = string
  default = "roboshop-dev-open-vpn"

}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "Roboshop"
    Environment = "Dev"
    Terraform   = "True"
  }
}

variable "open-vpn_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_open-vpn"
  }
}