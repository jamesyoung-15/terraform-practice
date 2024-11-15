terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = ">=3.4.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "imported_instance" {
    instance_type = "t2.nano"
    ami = "ami-063d43db0594b521b"
  
}