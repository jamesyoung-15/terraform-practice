variable "phone_number" {
  type      = string
  sensitive = true
#   default   = "867-5309"
}

output "phone_number" {
  value     = var.phone_number
  sensitive = true
}