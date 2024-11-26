data "aws_ssoadmin_instances" "example" {}

resource "aws_identitystore_user" "test_user" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
  display_name = "test_user"
  user_name = "test_user"
  name {
    given_name = "test"
    family_name = "user"
  }
  emails {
    value = "jamesyoung3931+aws-test-sso-1@gmail.com"
  }
}


output "name" {
  value = data.aws_ssoadmin_instances.example.identity_store_ids
}