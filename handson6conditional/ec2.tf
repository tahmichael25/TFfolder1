# https://developer.hashicorp.com/terraform/language/expressions/conditionals
#istest = true  -->   test environment
#istest = false -->   prod environment

###########################################################################################
# Example - 1
###########################################################################################

## Below is the variables blocks
variable "istest" {
  type = bool
  default = false
}
/*
## Below is the resource block which creates EC2 Instance
resource "aws_instance" "test" {
  count         = var.istest == true ? 3 : 0
  ami           = "ami-08d8ac128e0a1b91c"
  instance_type = "t2.micro"
}

*/

resource "aws_instance" "prod" {
  count         = var.istest == false ? 3 : 1
  ami           = "ami-08d8ac128e0a1b91c"
  instance_type = "t2.large"
}

###########################################################################################
# Example - 2
###########################################################################################

# # Below is the variables blocks
# variable "istest" {
#   default = "dobie"
# }

# # Below is the resource block which creates EC2 Instance
# resource "aws_instance" "second_example" {
#  ami           = var.istest == "dobie" ? "ami-XXXXXXXXXXX" : "ami-XXXXXXXXXXX"
#  instance_type = "t2.micro"
# }


#Below is the variables blocks
variable "env" {
  type = string
  default = "prod"             #prod or test
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "web_server" {
  ami           = var.env == "prod" ? "ami-08d8ac128e0a1b91c" : "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
}