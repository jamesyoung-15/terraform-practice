terraform {
    backend "s3" {
      bucket = "tf-test-state-jyy-15"
      key = "prod/aws_infra"
      region = "us-east-1"
    }
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = ">=3.4.0"
        }
    }
}