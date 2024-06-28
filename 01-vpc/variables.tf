variable "cidr_block" {
  type    = string
  default = "10.1.0.0/16"
}

variable "vpc_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_VPC"
  }
}

variable "igw_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_IGW"
  }
}

variable "public_subnet_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_public_subnet"
  }
}

variable "private_subnet_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_private_subnet"
  }
}

variable "database_subnet_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_database_subnet"
  }
}

variable "nat_gw_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_nat_gw"
  }
}

variable "rt_public_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_rt_public"
  }
}

variable "rt_private_function_tags" {
  type = map(any)
  default = {
    Name = "Roboshop_rt_private"
  }
}

variable "public_cidr_subnets" {
  default = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "private_cidr_subnets" {
  default = ["10.1.11.0/24", "10.1.12.0/24"]
}

variable "database_cidr_subnets" {
  default = ["10.1.21.0/24", "10.1.22.0/24"]
}

variable "is_peering_required" {
  type    = bool
  default = "true"
}
