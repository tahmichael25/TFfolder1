# Terraform variables with `.tfVars` files

In Terraform, `.tfvars` files are used to define variable values that can be easily input and managed separately from the main Terraform configuration files. These files allow you to specify custom values for variables without modifying the configuration code itself.

### Major use cases of Variables
-  Configuration separation: By using variables, you can separate the configuration data from the code. This separation makes it easier to manage and update variable values without modifying the underlying infrastructure code.

- Environment-specific values: Variables allow you to define different values for different environments or scenarios. By using .tfvars files, you can have separate files for each environment (e.g., dev.tfvars, prod.tfvars) and easily switch between them when deploying infrastructure to different environments.

- Collaboration and sharing: Variables provide a standardized way to share and collaborate on Terraform configurations. By defining variables with clear names and default values, it becomes easier for team members to understand and contribute to the infrastructure codebase.

### Example `.tfvars` configuration usage

```sh

variable "aws_region" {
  description = "The AWS region where resources will be provisioned."
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The EC2 instance type for the web server."
  type        = string
  default     = "t3.micro"
}

variable "environment" {
  description = "The environment where resources are being deployed."
  type        = string
  default     = "dev"
}

```
---
In this example:

- The variable block defines three variables with different `names`, `descriptions`, and `data types`.
- Each variable has a `default` value specified, which will be used if no other value is provided.
-  With this variable block, you can reference these variables throughout your Terraform configuration files, and their values can be overridden by providing new values in `.tfvars` files or as command-line flags when running Terraform commands.

For example, you can create a dev.tfvars file with custom values for the variables:

```sh

aws_region     = "us-east-1"
instance_type  = "t2.micro"
environment    = "development"

```
---

By using .tfvars files, you can easily customize the variable values for different environments or scenarios without modifying the main Terraform configuration files.

### How to deploy (plan and apply) tf configuration files with .tfvars

To plan a `.tfvars` file located in a seperate directory

```sh
    terraform plan -var-file="./path/variables.tfvars"
```
---

Here's is an example

```sh
    terraform plan -var-file="./path/variables.tfvars"
```
