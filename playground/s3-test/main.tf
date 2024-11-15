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

resource "aws_s3_bucket_policy" "test-policy" {
  bucket = aws_s3_bucket.my-test-bucket.bucket
  policy = "${file("s3_policy_file.json")}"
  # policy = <<EOT
  #     {
  #     "Version": "2012-10-17",
  #     "Statement": [
  #         {
  #             "Effect": "Allow",
  #             "Principal": "*",
  #             "Action": [
  #                 "s3:GetObject",
  #                 "s3:GetObjectVersion"
  #             ],
  #             "Resource": "arn:aws:s3:::tf-test-bucket-jyy151515/*"
  #         }
  #       ]
  #     }
  # EOT
}

