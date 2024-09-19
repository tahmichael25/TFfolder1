# Below is the resource block which creates EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0bfddf4206f1fa7b9"
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer"
  }
}

# Below is the provider which helps in connecting with AWS Account
provider "aws" {
  region  = "us-west-2"
  profile = "dev-profile"
}
