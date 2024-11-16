locals {
  test = max(5, 12)
  test1 = local.test + 5
  test2 = tostring(local.test1)
  test_string = "hello"
}

output "results" {
  value = {
    test = local.test
    test1 = local.test1
    test2 = local.test2
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "availability_zone" {
  value = slice(data.aws_availability_zones.available.names,1,3)
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private_subnets" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value)
  availability_zone = tolist(data.aws_availability_zones.available.names)[each.value]

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}

