#istest = true  -->   test environment
#istest = false -->   prod environment

###########################################################################################
# Example - 1
###########################################################################################

## Below is the variables blocks
variable "istest" {
  default = false
}
/*
## Below is the resource block which creates EC2 Instance
resource "aws_instance" "test" {
  count         = var.istest == true ? 3 : 0
  ami           = "ami-0bfddf4206f1fa7b9"
  instance_type = "t2.micro"
}

*/

/*
resource "aws_instance" "prod" {
  count         = var.istest == false ? 1 : 0
  ami           = "ami-0bfddf4206f1fa7b9"
  instance_type = "t2.large"
}

*/

###########################################################################################
# Example - 2
###########################################################################################

## Below is the variables blocks
#variable "istest" {
#   default = "dobie"
#}
#
## Below is the resource block which creates EC2 Instance
#resource "aws_instance" "second_example" {
#  ami           = var.istest == "dobie" ? "ami-XXXXXXXXXXX" : "ami-XXXXXXXXXXX"
#  instance_type = "t2.micro"
#}


variable "create_instance" {
  type        = bool     #true or a false
  default     = "true"
  description = "Variable to determine if an instance should be created or not"
}

variable "create_instance" {}
create_instance = false

resource "aws_instance" "test_instance" {
    #count = var.create_instance ? 1 : 0
    count = var.create_instance ? 3 : 1

    ami = "ami-80983072893492"
    instance_type = "t2.micro"

    tags {
        Name = "prod_server"
    }
}




variable "environment" {
  type        = string
  default     = "staging"           # production or staging
  description = "description"
}

variable "environment" {
  type        = string
  default     = "production"           # production or staging
  description = "description"
}

resource "aws_instance" "test_instance" {
    count = var.environment == "production" ? 2:0
    production == production = 2
    production == staging = 1

    ami = "ami-80983072893492"
    instance_type = "t2.micro"

    tags {
        Name = "prod_server"
    }
}






