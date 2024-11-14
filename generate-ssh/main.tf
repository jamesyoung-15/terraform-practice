terraform {
  required_providers {
    tls = {
        source  = "hashicorp/tls"
        version = ">=3.1.0"
    }
    local = {
        source  = "hashicorp/local"
        version = "~>2.5"
    }
  }
}


resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.generated_key.private_key_pem
  filename = "private_key.pem"
}