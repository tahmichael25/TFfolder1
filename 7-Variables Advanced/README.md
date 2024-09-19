# List and Map variable type

## `List-type` Variable

In Terraform, a list variable is a variable type that represents an ordered collection of values. Each element in the list can be of the same or different types. List variables are useful when you need to define multiple values for a single variable, such as a list of IP addresses, a list of tags, or a list of security group IDs.

### Common use-cases of `list-type` variable
Common use cases for list variables in Terraform include:
- **IP addresses or CIDR blocks**: You can use a list variable to define a range of IP addresses or CIDR blocks for various purposes like defining allowed ingress or egress rules in security groups or configuring network ACLs.
- **Availability zones**: When working with cloud providers that offer multiple availability zones, a list variable can be used to define the list of availability zones to distribute resources across multiple zones.
- **Tags**: Many cloud resources support tags for identification and categorization. A list variable can be used to define a list of key-value pairs for tagging resources.
- **Security group IDs**: In cloud environments, security groups are used to control inbound and outbound traffic to instances. You can use a list variable to specify a list of security group IDs for resources like EC2 instances or RDS instances.

### Example of using `list-type`
Here are examples of how you can reference values in a list variable:

```sh
variable "instance_types" {
  type        = list(string)
  description = "A list of EC2 instance types"
  default     = ["t2.micro", "m5.large", "c5.xlarge"]
}
```
---
In the above example, a list variable named  `instance_types` is defined with a type of `list(string)`. It has a default value of [`"t2.micro"`, `"m5.large"`, `"c5.xlarge"`].


## `Map-type` Variable

In Terraform, a map variable is a variable type that represents a collection of key-value pairs. Each key in the map must be unique, and the values can be of any type. Maps provide a convenient way to organize and manage related data.

### Common use-cases of `map-type` variable
Common use cases for map variables in Terraform include:

- **Configuration settings**: Maps can be used to define various configuration settings for resources or modules. Each key-value pair represents a specific setting or parameter that can be customized.
- **Environment-specific values**: Maps can be used to store environment-specific values, such as credentials, endpoints, or configuration options. By using a map variable, you can easily switch between different environments (e.g., development, staging, production) without modifying the underlying Terraform code.
- **Resource metadata or attributes**: Maps can be used to define metadata or attributes associated with resources. For example, you can use a map to store additional information about an EC2 instance, such as the instance name, owner, or tags.
- **Conditional configuration**: Maps can be used to define conditional configurations by associating specific settings with different conditions or scenarios. This allows for dynamic and flexible resource provisioning based on different inputs or environments.

### Example of using `map-type` variable
Here are examples of how you can reference values in a map variable:

```sh
variable "ec2-instance-tags" {
  type        = map(any)
  description = "A map representing resource configurations"
  default = {
    name        = "web-server"
    environment = "production"
    owner       = "John Doe"
  }
}

```
---

In the above example, the `ec2-instance-tags`variable is defined as a map with `keys` representing different configuration settings. Each `key` is associated with a value of any type.