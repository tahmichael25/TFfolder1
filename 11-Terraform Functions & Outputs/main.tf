
# Local Variables Block
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

# Below is the resource block which creates EC2 Instance
resource "aws_instance" "myec2" {
  ami = var.ami["us-west-2"]
  instance_type = "t2.micro"
  tags = {
    date_created = local.time
  }
}
