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
    # region = "us-west-1"
}

resource "aws_instance" "ec2_instance" {
    instance_type = "t2.nano"
    ami = "ami-063d43db0594b521b"
    # ami = "ami-02a7ad1c45194c72f" # us-west-1 ami
}