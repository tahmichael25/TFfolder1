# Below is the variable block which stores the logical names of  EC2 Instance specifications
variable "instance_type" {
  type        = string
  description = "instance_type is the logical name of our EC2 instance type"
  default     = "t2.small"
}

variable "ami_id" {
  type        = string
  description = "ami_id is the logical name of our AMI"
  default     = "ami-0bfddf4206f1fa7b9"
}


variable "prod_instance_name" {
  type        = string
  description = "ec2_instance_name is the logical name of our EC2 instance"
  default     = "prodserver"
}

variable "dev_instance_name" {
  type        = string
  description = "ec2_instance_name is the logical name of our EC2 instance"
  default     = "devserver"
}

variable "test_instance_name" {
  type        = string
  description = "ec2_instance_name is the logical name of our EC2 instance"
  default     = "testserver"
}