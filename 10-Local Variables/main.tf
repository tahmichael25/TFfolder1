
###########################################################################################
# Example - 1
###########################################################################################
/*
locals {
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}


resource "aws_instance" "app-dev" {
   ami = "ami-00f7e5c52c0f43726"
   instance_type = "t2.micro"
   tags = local.common_tags
}
#
resource "aws_instance" "db-dev" {
   ami = "ami-XXXXXXXXXXXX"
   instance_type = "t2.small"
   tags = local.common_tags
}
#
resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-west-2a"
  size              = 8
  tags = local.common_tags
}
*/

###########################################################################################
# Example - 2
###########################################################################################

/*
# Local Variables Block
locals {
  common_tags={
    Owner = "Devops Team"
    cs = "support@jjtechinc.co"
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
  prod_tags={
    Owner = "Prod Team"
    cs = "prod@jjtechinc.co"
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())

  }
  dev_tags={
    Owner = "dev Team"
    cs = "dev@jjtechinc.co"
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}
*/

#tags  {
#  Name = "prod-server"
#}

# Below is the resource block which creates EC2 Instance
# merge is used to combine multiple maps into a single map e.g merge(map1, map2, ...)

/*
resource "aws_instance" "test1" {
   ami = "ami-0bfddf4206f1fa7b9"
   instance_type = "t2.micro"   
  tags = merge(local.common_tags,{Name = "prod-server"})
}

*/

/*
resource "aws_instance" "test2" {
   ami = "ami-0bfddf4206f1fa7b9"
   instance_type = "t2.micro"
  tags = merge(var.env == "dev" ? local.dev_tags : local.prod_tags,{Name = "dev"})
}

*/

/*
resource "aws_instance" "test3" {
   ami = "ami-0bfddf4206f1fa7b9"
   instance_type = "t2.micro"
  tags = merge(local.common_tags,{Name = "prod-instance"})
}

*/