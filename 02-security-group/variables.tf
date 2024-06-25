variable "mongodb_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_mongodb_SG"
    }
}

variable "redis_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_redis_SG"
    }
}

variable "mysql_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_mysql_SG"
    }
}

variable "rabbit_mq_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_rabit_mq_SG"
    }
}

variable "catalogue_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_catalogue_SG"
    }
}

variable "user_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_user_SG"
    }
}

variable "cart_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_cart_SG"
    }
}

variable "shipping_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_shipping_SG"
    }
}

variable "payments_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_payments_SG"
    }
}

variable "web_sg_function_tags" {
    type = map 
    default = {
        Name = "Roboshop_web_SG"
    }
}

variable "mongodb_ingress_rules" {
  default = [
    {
      description = "Allow port 80"
      from_port   = 80 # 0 means all ports
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow port 443"
      from_port   = 443 # 0 means all ports
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}