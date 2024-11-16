terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "jamesyoung-15"

    workspaces {
      name = "tf-aws-test"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.43.0"
    }
  }
}