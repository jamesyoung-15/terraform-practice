variable "environment" {
  type = string
  description = "Infrastructure environment. eg. dev, prod, etc"
  default = "test"
}

variable "region" {
  type = string
  description = "AWS region"
  default = "us-east-2"
}

variable "vpc_name" {
  type = string
  default = "vpc-test-default"
}