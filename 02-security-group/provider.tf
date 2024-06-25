terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }

  backend "s3" {
    bucket = "daws-common-bucket"
    key    = "terraform-2-roboshop-project-02-security-group"
    region = "us-east-1"
    dynamodb_table = "daws-common-tfstate"
  }
}

provider "aws" {
  region = "us-east-1" 
}