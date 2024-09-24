# Below is the variables blocks
variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0ebfd941bbafe70c6"
    "us-west-2" = "ami-08d8ac128e0a1b91c"
    "ap-south-1" = "ami-08718895af4dfa033"
  }
}