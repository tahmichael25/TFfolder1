# Local variables

In Terraform, a local variable is a variable that is defined within a Terraform module or configuration file. Local variables allow you to create intermediate values or calculations that can be reused within the same module or configuration

## Common use-cases of local variables

- **Complex calculations**: Local variables can be used to perform complex calculations or transformations on input variables or resources. This allows you to simplify your code by abstracting away the complexity and making it more readable.

- **Derived values**: Local variables can be used to derive values based on other variables or resources. For example, you can calculate the subnet CIDR blocks based on a VPC CIDR block or generate resource names based on specific naming conventions.

- **Code reuse**: Local variables can be used to store reusable values or expressions that are referenced multiple times within a module or configuration. This helps avoid duplication and ensures consistency across your codebase.

- **Conditional logic**: Local variables can be used to define conditionals or conditional expressions. You can use them to enable or disable certain features or resources based on input variables or other conditions.

### Example usage of `local` variable
Here's an example of how you can define and use local variables in Terraform:

```sh

locals {
  vpc_cidr_block       = "10.0.0.0/16"
  instance_tag = "web-server-"
  instance_count       = 3
}

# VPC configuration
resource "aws_vpc" "example" {
  cidr_block = local.vpc_cidr_block

}

# Instance configuration
resource "aws_instance" "example" {
  count         = local.instance_count
  instance_type = "t2.micro"

  tags = {
    Name = local.instance_tag  # Using local variable in a tag value
  }


}

```
---

In the above example, the `locals` block defines multiple local variables:

- `vpc_cidr_block` stores the VPC CIDR block.

- `instance_tag` stores the prefix for instance names.

- `instance_count` specifies the number of instances to create.

These local variables are then used within resource blocks:

- The `aws_vpc` resource uses local `vpc_cidr_block` as the VPC's CIDR block.

- The `aws_instance` resource uses `local.instance_count` to determine the number of instances to create. It also uses `local.instance_tag` in the Name tag for each instance.
