# Terraform Variables

In Terraform, variables are used to define and input values that can be used throughout your Terraform configuration. They allow you to parameterize your infrastructure code and make it more flexible and reusable.

## Major use cases of Variables

- **Reusability**: Variables enable you to define values that can be reused across multiple resources and modules. By centralizing values in variablaes, you can avoid duplicating code and easily make changes to values in a single location.

- **Flexibility**: With variables, you can make your Terraform configurations more flexible. By allowing users to input values when running Terraform, you can customize deployments for different environments or scenarios without modifying the underlying code.

- **Maintainability**: Variables contribute to the maintainability of your infrastructure code. By using variables, you can separate configuration data from the code itself, making it easier to understand, update, and troubleshoot your Terraform configurations.

- **Collaboration**: Variables facilitate collaboration by providing a standardized way to define and share inputs among team members. You can define variables with clear descriptions and default values, making it easier for others to understand and use your code.

- **Dynamic configurations**: Variables allow you to create dynamic and conditional configurations. You can use variables in conjunction with conditional expressions and functions to create configurations that adapt based on different conditions or inputs.

## Example `variable.tf` configuration file

```sh

variable "region" {
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

variable "availability_zones" {
  description = "A list of availability zones to distribute resources."
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}


```
---

In this example:

- The variable blocks define four variables with different data types (`string` and `list`).
- Each variable has a description that explains its purpose.
- The `default` attribute sets the default value for the variable, which will be used if no other value is provided.
-  Users can override these default values by specifying new values through command-line flags, environment variables, or input files when running Terraform commands
