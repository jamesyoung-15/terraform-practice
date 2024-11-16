locals {
  name = "James"
  age = 25
}

locals {
  test = "${local.name} is ${local.age} years old"
}