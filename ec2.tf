provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "web" {
  ami           = "ami-0bfddf4206f1fa7b9"
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer"
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# On Windows do the below:
# https://chocolatey.org/install
# https://community.chocolatey.org/packages/terraform#install

