terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "jamesyoung-15"

    workspaces {
      name = "aws-testing"
    }
  }
}