# TF Associate Labs

Labs for TF associate based on Udemy [course](https://www.udemy.com/course/terraform-hands-on-labs/).

## Labs

### Lab 1

Main goals:

- Understand basics of Terraform, including:
  - Basic configuration, versioning
  - Resources
  - Variables
  - Outputs
  - Provisioners

Lab:

- Created, modified, destroyed AWS resources
- Generated SSH key and save to local, able to SSH into instance using provisioners

Notes:

- Resources: Represents some infrastructure object or service (eg. EC2 instance, ALB, etc.)
- State: Acts as a snapshot of the current infrastructure, where it tracks resources, maps configuration to resources, etc.
- Variables: Can have local, environmental, input variables and can also output variables
- Provisioners: Allow to model specific actions, so can do things like locally or remotely execute commands

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

``` bash
terraform workspace new new_workspace # create new workspace
terraform workspace select new_workspace # switch to it
```

Notes:

- Import: Useful when you have existing infra not using Terraform
- Workspaces: Useful if you need same configuration with different state data (eg. create dev infra before modifying production)
  - For larger systems, seperate config better

## Lab 3

Main goal:

- Learn about Terraform modules

Lab:

- Create S3 static website Terraform module
- Use module to host static website with S3

Notes:

- Modules: A directory that contain set of configuration files that can be called in other directories.
  - Works similar to libraries in programing languages, gives benefit of being able to organize and re-use configs.
  - Can use remote or local

## Lab 4

Main goal:

- Understand Terraform core workflow

Lab:

- Init, validate, plan, apply, destroy

Notes:

- Init: Initializes working directory, such as installing plugins
- Validate: Check config syntax and if config is consistent
- Plan: Does dry run, shows changes (resources created/destroyed), and check if proposed changes match what you expect before applying
- Apply: Executes actions proposed in Terraform plan
- Destroy: Destroy remote objects in config

## Lab 5

Main goal:

- Understand Terraform state
- Implement and maintain Terraform state

Lab:

- asd

Notes:

- Terraform State: Acts as a snapshot of the current infrastructure, where it tracks resources, maps configuration to resources, etc.
- Backend Config: By default uses local, can also integrate with HCP Terraform or define own backend
