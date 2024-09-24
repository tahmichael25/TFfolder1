# Below is the resource block which creates EC2 Instance
resource "aws_instance" "test" {
  ami           = "ami-08d8ac128e0a1b91c"
  instance_type = "t2.micro"
  tags = {
    Name = "backend_instance"
  }
}
