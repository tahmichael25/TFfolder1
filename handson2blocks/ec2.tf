# Below is the resource block which creates EC2 Instance
resource "aws_instance" "prod_instance" {
  ami           = var.ami_id        # This is AMI of AML2
  instance_type = var.instance_type # This is Instance type
  tags = {
    Name = var.prod_instance_name # This is tag
  }
}

resource "aws_instance" "dev_instance" {
  ami           = var.ami_id        # This is AMI of AML2
  instance_type = var.instance_type # This is Instance type
  tags = {
    Name = var.dev_instance_name # This is tag
  }
}


resource "aws_instance" "test_instance" {
  ami           = var.ami_id        # This is AMI of AML2
  instance_type = var.instance_type # This is Instance type
  tags = {
    Name = var.test_instance_name # This is tag
  }
}