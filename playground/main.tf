terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">=3.1.0"
    }
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

resource "random_string" "test" {
  length  = 16
  special = false
  numeric = false
  upper = false
}

resource "aws_s3_bucket" "my-test-bucket" {
  depends_on = [random_string.test]
  bucket     = "${var.s3_bucket_name}-${random_string.test.result}"

  tags = local.bucket_tags
}
