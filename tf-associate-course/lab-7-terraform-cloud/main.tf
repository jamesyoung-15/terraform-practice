provider "aws" {
  region = var.region
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = var.vpc_name
    Environment = var.environment
    Terraform   = "true"
  }
}