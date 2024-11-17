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

- Create S3 backend, use remote backend
- Create Terraform Cloud, use remote backend
- Migrate state

Notes:

- Terraform State: Acts as a snapshot of the current infrastructure, where it tracks resources, maps configuration to resources, etc.
- Backend Config: By default uses local, can also integrate with HCP Terraform or define own backend
- Troubleshoot: If run into error with `failed to install provider` that says `doesn't match any of the
│ checksums previously recorded in the dependency lock file;`, use `terraform providers lock` to pre-populate checksums for a variety of different platforms

## Lab 6

Main goals:

- Understand local variables
- Use different input variables (defaults, environment, tfvars, CLI)
- Validate and suppress sensitive info
- Data blocks
- Built-in Functions
- Dynamic Blocks
- TF Graphs
- Resource Lifecycle

Notes:

- Variables: Can use default, local, `.tfvars`, environment, CLI to set variables
- Protecting Sensitive Info
  - Mark with `sensitive = true` to avoid output directly (local State file will still show sensitive values in plain text)
  - Can use environment variables for better security, but will still show in local state file
  - Must protect state file, can use Terraform cloud to manage sensitive values
- Data Blocks: Can be used to query and fetch data to use (eg. AMIs)
- Dynamic Blocks: Used for repeatable nested blocks, avoid copy and pasting
- Graph: Can use `terraform graph` and `webgraphviz.com` to visualize relationships between resources
- Resource Lifecycle: Control order Terraform create and destroy resources
  - eg. `create_before_destroy` a security group to prevent failure
  - eg. `prevent_destroy` an instance for safeguard

## Lab 7

Main goals:

- Understand Terraform Cloud
  - Remote Backend
  - Workspaces
  - Secure variables
  - Version Control
  - Registries, Sentinel Policy, VCS Workflow

Notes:

- Workspaces: Helps manage multiple deployments with same config by different state files.
- Sentinel Policy: Enforces logic-based policy decisions (eg. enforce tags, restrict ec2 instance types)
  - 3 types: advisory, soft mandatory, hard mandatory
