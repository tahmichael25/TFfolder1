# Conditional Expressions
In Terraform, you can use conditional expressions to control resource creation dynamically. This allows you to create resources based on certain conditions, making your configurations more flexible.
The main purpose is to create resources based on a fixed condition that doesn't require user input or external data.
*Example*

```sh

resource "resource_type" "name" {
  count = condition ? 1 : 0

  # Resource configuration
}
```
---
- `condition`: A boolean expression that evaluates to `true` or `false`.
- `count = condition ? 1 : 0`:
    If condition is `true`, the resource is created with a count of `1`.
    If condition is `false`, the resource is not created (count of `0`).

## Use cases
###  Conditional Creation Based on Boolean Variable
Suppose you want to create an AWS EC2 instance only if a certain flag is set to true.

```sh

variable "create_instance" {
  description = "Flag to create an EC2 instance"
  type        = bool
  default     = true  # Set to false if you don't want to create the instance
}

resource "aws_instance" "example" {
  count         = var.create_instance ? 1 : 0  # Create instance if true

  ami           = "ami-0bfddf4206f1fa7b9"          # Replace with a valid AMI ID
  instance_type = "t2.micro"
}
```
---

- If `create_instance` is true, one EC2 instance will be created. If false, no instance will be created.

### Conditional Creation Based on Environment
You might want to create different resources based on the environment (e.g., production vs. staging)

```sh
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "staging"  # Can be "production" or "staging"
}

resource "aws_instance" "web_server" {
  count         = var.environment == "production" ? 2 : 1  # 2 instances in production, 1 in staging

  ami           = "ami-0bfddf4206f1fa7b9"             # Replace with a valid AMI ID
  instance_type = "t2.micro"
}
```
---

- In the production environment, two EC2 instances will be created. In staging, only one instance will be created

### Conditional Creation with Multiple Resources
You can also use conditional expressions to manage multiple related resources, such as security groups or IAM roles based on the same condition.

```sh

variable "enable_security_group" {
  description = "Flag to create a security group"
  type        = bool
  default     = true
}

resource "aws_security_group" "example" {
  count = var.enable_security_group ? 1 : 0

  name        = "example_sg"
  description = "Example security group"
}

resource "aws_instance" "example" {
  count         = 1  # Always create 1 instance

  ami           = "ami-0bfddf4206f1fa7b9"        # Replace with a valid AMI ID
  instance_type = "t2.micro"

  vpc_security_group_ids = var.enable_security_group ? [aws_security_group.example[0].id] : []
}
```
---

- A security group is created only if `enable_security_group` is true. The EC2 instance will use the created security group if it exists; otherwise, it won’t be associated with any security group.

