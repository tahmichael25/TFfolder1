# ----------------------------
# Terraform Configuration Block
# ----------------------------
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# ----------------------------
# Provider Block
# ----------------------------
provider "aws" {
  region = var.aws_region
}

# ----------------------------
# Variables Block
# ----------------------------
variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The key pair name for SSH access"
  type        = string
}

variable "instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
}

variable "root_volume_size" {
  description = "Size of the root volume in gigabytes"
  type        = number
}

# ----------------------------
# EC2 Instance Resource
# ----------------------------
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.web_server.id]

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }

  user_data = <<-EOF
    #!/bin/bash
    # Install Apache web server
    sudo yum update -y
    sudo yum install -y httpd

    # Start the web server
    sudo systemctl start httpd
    sudo systemctl enable httpd

    # Create a simple HTML file
    echo "<html><body><h1>Welcome to my Marie's home page</h1></body></html>" > /var/www/html/index.html
  EOF

  metadata_options {
    http_endpoint          = "enabled"
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }
}

# ----------------------------
# Security Group Resource
# ----------------------------
resource "aws_security_group" "web_server" {
  name        = "${var.instance_name}-sg"
  description = "Security group for web server"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

# ----------------------------
# Outputs Block
# ----------------------------
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web_server.public_ip
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.web_server.id
}