instance_types = t2.micro, t2.small, t2.medium

instance_types = t2.micro, 2, t2.medium 

prod = t2.micro, Amazon linux 2 = "ami-983947348390"
stage = t2.small, CentOs = "ami-03489489283928"
dev = t2.medium, RedHat = "ami-3409239283782"


variable "ami_id_prod {
  type        = string
  default     = "ami-03489489283928"
  description = "description"
}


variable "ami_id" {
  type = map(any)
  default = {
    linux = "ami-983947348390"
    centos = "ami-03489489283928"
    redhat = "ami-3409239283782"
  }
}

variable "tag" {
  type = map
  default = {
    name = "prod_server"
    environment = "dev"
  }
}


variable "instance_types" {
  type        = list(string)
  #length = 3
  #index            0             1           2
  default     = ["t2.micro", "t2.small", "t2.medium"]
  description = "description"
}

resource "aws_instance" "prod_server" {
  ami_id = var.ami["linux"]
  instance_type = var.instance_types[0]
}
