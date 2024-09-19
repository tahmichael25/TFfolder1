# Below is the variables blocks
variable "ec2_name_tag" {
  default = ["firstinstance", "secondinstance"]
}

variable "instance_type" {
  #   0          1          2
  default = ["t2.medium", "t2.micro"]
  type    = list(string)
}
variable "ami_ids" {
  default = {
    linux  = "ami-08d8ac128e0a1b91c",
    ubuntu = "ami-05134c8ef96964280"
  }
}
