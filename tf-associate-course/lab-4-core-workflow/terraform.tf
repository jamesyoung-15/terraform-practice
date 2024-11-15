terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">=3.3.0"
    }
  }
}