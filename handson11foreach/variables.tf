# Below is the variables blocks
variable "ec2_name_tag" {
  default = ["name1", "name2","name3"]
}

variable "instance_type" {
            #   0          1          2
  default = ["t2.micro", "t2.medium","t2.micro"]
}

variable "ami_ids" {
  default = {
    0 = "ami-08d8ac128e0a1b91c",
    1 = "ami-05134c8ef96964280",
    2 = "ami-0423fca164888b941"
  }
}