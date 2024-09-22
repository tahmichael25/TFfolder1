# terraform.tfvars

aws_region           = "us-west-2"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["us-west-2a", "us-west-2b"]
web_server_count     = 2
ami_id               = "ami-08d8ac128e0a1b91c"  # Amazon Linux 2 AMI (verify this is correct for us-west-2)
environment          = "development"
db_username          = "admin"
db_password          = "dbTahpasswd"  # Remember to change this to a secure password