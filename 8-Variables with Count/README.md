# Variable with COUNT function

## `Count` fuction

The count function in Terraform is used to manage the creation of multiple instances of a resource based on a specified count value. It allows you to define a resource that can be provisioned multiple times without duplicating the resource block.

### Simple example of using `count`
Here’s a simple example of using the count function in Terraform with a fixed number to create multiple resources:

```sh

resource "aws_instance" "example" {
  count         = 3  # This will create 3 EC2 instances
  ami           = "ami-0bfddf4206f1fa7b9"  # Replace with a valid AMI ID
  instance_type = "t2.micro"
}
```
---
`count = 3`: This line specifies that Terraform should create three instances of the aws_instance resource.
Each instance can be accessed using an index, for example:
- aws_instance.example[0] for the first instance
- aws_instance.example[1] for the second instance
- aws_instance.example[2] for the third instance

### Count using a variable 
Using a variable with the count function in Terraform allows you to dynamically control how many instances of a resource are created based on user input or configuration settings.

Here's how you can use a variable to define the count of AWS EC2 instances:

```sh

# Define a variable for the number of instances
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2  # Default value is set to 2
}

resource "aws_instance" "example" {
  count         = var.instance_count  # Use the variable for count
  ami           = "ami-0bfddf4206f1fa7b9"        # Replace with a valid AMI ID
  instance_type = "t2.micro"
}

```
---

- *Variable Definition*: The variable `instance_count` block defines a variable named `instance_count`. It has a type of number and a default value of 2.

- *Using the Variable in Count*: In the `aws_instance` resource block, `count = var.instance_count` uses the value of the 'instance_count' variable to determine how many EC2 instances will be created.


### Count using a list-type variable with length

Using a list variable type with the count function in Terraform allows you to create multiple resources based on the length of the list. This is useful when you want to provision resources that correspond to specific items in a list.

Here’s how to use a list variable to define the number of instances to create in Terraform:

```sh

# Define a list variable for instance types
variable "instance_types" {
  description = "List of EC2 instance types to create"
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t2.medium"]  # Example instance types
}

resource "aws_instance" "example" {
  count         = length(var.instance_types)  # Use the length of the list for count
  ami           = "ami-123456"                 # Replace with a valid AMI ID
  instance_type = var.instance_types[count.index]  # Use the instance type from the list
}

```
---


*Variable Definition*
- The variable `instance_types` block defines a list variable named `instance_types`, which holds different EC2 instance types. 
The default value is a list of three instance types: ["t2.micro", "t2.small", "t2.medium"].

*Using `Length` for Count*
- In the aws_instance resource block, `count = length(var.instance_types)` uses the length function to determine how many instances to create. 
In this case, it will create three instances because the list has three items.

*Dynamic Instance Type Assignment*
- The line `instance_type = var.instance_types[count.index]` assigns the instance type for each created instance based on the corresponding index in the list. For example:
 - The first instance will use `t2.micro`
 - The second instance will use `t2.small`
 - The third instance will use `t2.medium`
