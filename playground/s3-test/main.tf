terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  bucket_tags = {
    Name = "Test bucket"
  }
}


resource "aws_s3_bucket" "my-test-bucket" {
  bucket = var.s3_bucket_name

  tags = local.bucket_tags
}
