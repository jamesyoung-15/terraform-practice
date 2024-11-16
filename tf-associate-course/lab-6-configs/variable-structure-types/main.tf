resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
}

# resource "aws_subnet" "test-subnet-1" {
#   for_each          = var.ip
#   vpc_id            = aws_vpc.test-vpc.id
#   cidr_block        = each.value
#   availability_zone = var.us-east-1-azs[0]

# }

resource "aws_subnet" "list_subnet-2" {
  for_each          = var.env
  vpc_id            = aws_vpc.test-vpc.id
  cidr_block        = each.value.ip
  availability_zone = each.value.az
}