# Below is the resource block which creates EC2 Instance
resource "aws_instance" "prod_instance" {
  ami           = var.ami_id        # This is AMI of AML2
  instance_type = var.instance_type # This is Instance type
  tags = {
    Name = var.ec2_instance_name # This is tag
  }
}