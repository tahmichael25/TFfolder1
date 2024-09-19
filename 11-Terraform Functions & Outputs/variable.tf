# Below is the variables blocks
variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-XXXXXXXXXXXX"
    "us-west-2" = "ami-0bfddf4206f1fa7b9"
    "ap-south-1" = "ami-XXXXXXXXXXXX"
  }
}