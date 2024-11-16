terraform {
  backend "s3" {
    bucket = "tf-test-state-jyy-15"
    key    = "prod/aws_infra"
    region = "us-east-1"

    dynamodb_table = "tf-lock-test"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.4.0"
    }
  }
}