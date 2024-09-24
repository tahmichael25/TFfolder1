Variables with For_each Loops
In Terraform, variables can be combined with for_each loops to create dynamic configurations based on a set of values. This allows you to iterate over a list of values and use each value within the variable definition.

Using each.key and each.value
When using for_each with a variable, you can access the current iteration's key and value using each.key and each.value, respectively.

each.key: Represents the current key from the loop's iteration.
each.value: Represents the current value associated with the key.
Example 1: Creating Multiple S3 Buckets
Here's an example that creates multiple S3 buckets based on a variable containing bucket names:
variable "bucket_names" {
  type    = list(string)
  default = ["bucket1", "bucket2", "bucket3"]
}

variable "bucket_region" {
  type    = string
  default = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  for_each = var.bucket_names

  bucket = each.value
  region  = var.bucket_region
}
Explanation
bucket_names: A list of bucket names.
bucket_region: The region for all buckets.
for_each = var.bucket_names: Iterates over the list of bucket names.
bucket = each.value: Sets the bucket name for each iteration.
region = var.bucket_region: Sets the region for all buckets.
This example demonstrates how to create multiple resources based on a list of values, using for_each to iterate over the list and access the values using each.value.

Example 2: Using each.key in a Terraform Resource
e want to create multiple EC2 instances with unique names based on a list of instance types.
variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t3.nano"]
}

resource "aws_instance" "example" {
  for_each = var.instance_types

  instance_type = each.value
  ami           = "ami-0c55b159cbfafe1f0" # Replace with your desired AMI

  tags = {
    Name = "instance-${each.key}"
  }
}
Explanation
instance_types variable: Defines a list of instance types.
for_each loop: Iterates over the instance_types list.
each.value: Sets the instance_type for each instance based on the current value in the list.
each.key: Creates a unique name for each instance using the index (key) of the current element in the list
This configuration will create two EC2 instances with the following names:

instance-0 (using the t2.micro instance type)
instance-1 (using the t3.nano instance type)