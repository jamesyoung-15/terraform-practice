# TF Associate Labs

Labs for TF associate based on Udemy [course](https://www.udemy.com/course/terraform-hands-on-labs/).

## Labs

### Lab 1

- Created VPC, public private subnets, route table, SG (taken from template)
- Created EC2 instance
- Generated SSH key and save to local, able to SSH into instance

Main goals:

- Understand basics of Terraform, including:
  - Basic configuration, versioning
  - Resources
  - Variables
  - Outputs
  - Provisioners

## Lab 2

Main Goals:

- Learn to import resource to Terraform
- Learn about workspaces
- Learn about taint, state CLI, basic debugging

### Importing Resource

- Import Resources w/ EC2

``` bash
terraform import aws_instance.imported_instance i-0bfff5070c5fb87b6
```

- Check imported resource info/attributes

``` bash
terraform state show aws_instance.imported_instance
```

- Use output info/attributes to add to configuration

### Workspaces
