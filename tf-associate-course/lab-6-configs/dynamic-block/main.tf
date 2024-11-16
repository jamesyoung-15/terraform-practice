resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
}

locals {
  ingress_rules = [{
      port        = 443
      description = "Port 443"
    },
    {
      port        = 80
      description = "Port 80"
    }
  ]
}

# dynamic block example
resource "aws_security_group" "main" {
  name   = "core-sg"
  vpc_id = aws_vpc.test-vpc.id

  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}




# equivalent
# resource "aws_security_group" "main" {
#   name   = "core-sg"
#   vpc_id = aws_vpc.vpc.id

#   ingress {
#     description = "Port 443"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Port 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }