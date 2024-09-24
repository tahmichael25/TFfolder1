
###########################################################################################
# Example - 1
###########################################################################################


# Data source to retrieve the EC2 instance
data "aws_instance" "web_server" {
  filter {
    name   = "tag:Name"
    values = ["web_server"]
  }
}

# Output the instance ID and public IP
output "instance_id" {
  value = data.aws_instance.web_server.id
}

output "public_ip" {
  value = data.aws_instance.web_server.public_ip
}



###########################################################################################
# Example - 2
###########################################################################################

/*
# Data source to retrieve the latest Amazon Linux AMI
data "aws_ami" "latest_amzn_linux" {
  most_recent = true          # Ensures we get the latest version of the AMI
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Filters search based no AMI. Example here is that with AMI amzn-linux-latest*
  }

  owners      = ["amazon"]    # Limits the search to AMIs owned by Amazon.
}

# Resource to create an EC2 instance using the retrieved AMI
resource "aws_instance" "prod_server" {
  ami           = data.aws_ami.latest_amzn_linux.id
  instance_type = "t2.micro"
}

*/


###########################################################################################
# Example - 3
###########################################################################################

/*
data "aws_ami" "app_ami" {
    most_recent = true

    filter {
        name   = "name"
        values = ["*ubuntu*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"] # 
}

resource "aws_instance" "instance-1" {
    ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
}

output "test" {
  value = data.aws_ami.app_ami
}
*/