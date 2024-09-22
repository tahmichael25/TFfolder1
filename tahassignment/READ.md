<!-- This configuration is set up to run in the Oregon AWS region (us-west-2) and should create all resources successfully. Here are some key points about this configuration:

The AMI ID in terraform.tfvars is set to an Amazon Linux 2 AMI. You should verify this is correct for the us-west-2 region before deploying.
The db_password in terraform.tfvars should be changed to a secure value before deployment.
The EC2 instances and RDS instance are using t2.micro instance types, which are part of the AWS free tier (subject to usage limits).
The configuration uses the latest AWS provider version 3.x. You may want to pin to a specific version for production use.
The .gitignore file is set up to exclude sensitive files and local Terraform state.


To use this configuration:

Save each section into its respective file (terraform.tfvars, main.tf, outputs.tf, providers.tf, variables.tf, and .gitignore).
Create a user_data.tpl file with the following content:
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Welcome to EL ROI's Magic ${project_name}</h1>" > /var/www/html/index.html
========================
# In your main.tf @ the userdata lines edit and put the below
  user_data = templatefile("${path.module}/user_data.tpl", {
    project_name = local.project_name
  })
========================

OR


# user_data.tpl

#!/bin/bash
# Update package lists
sudo yum update -y
# Install Apache
sudo yum install httpd -y
# Create an HTML file
cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
<head>
<title>Congratulations Michael!</title>
<style>
body {
    background-color: #007bff; /* Blue background */
}
h1 {
    color: pink;
    font-family: Arial;
    font-size: 22px;
    text-align: center;
}
</style>
</head>
<body>
<h1>Well done Michael on being a Sr. Cloud Engineer</h1>
</body>
</html>
EOF
# Start Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# main.tf (update the aws_instance resource)

resource "aws_instance" "web" {
  count                  = var.web_server_count
  ami                    = var.ami_id
  instance_type          = var.instance_type_map[var.environment]
  subnet_id              = aws_subnet.public[count.index % length(var.public_subnet_cidrs)].id
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = file("${path.module}/user_data.tpl")

  tags = merge(local.common_tags, {
    Name = "${local.project_name}-web-server-${count.index + 1}"
  })
} 


Run terraform init to initialize the Terraform working directory.
Run terraform plan to see what changes will be made.
Run terraform apply to create the resources.

Remember to run terraform destroy when you're done to avoid unnecessary AWS charges.

-->

# The below are used to comment out (code is not read when used)

<!--   Anything  -->

ctrl + /   which selects everything  

or 

/*
Provider
*/
===========================================================================
Commands ran:

terraform init
terraform fmt
terraform validate
terraform plan --var-file=values/terraform.tfvars
terraform apply  --var-file=values/terraform.tfvars --auto-approve
terraform destroy  --var-file=values/terraform.tfvars --auto-approve
ls
ll -ltra
rm -rf .terraform .terraform.lock.hcl terraform.tfstate.backup terraform.tfstate