ASG
desired_capacity = 3

variable "desired_capacity" {
  type        = number
  default     = 3
  description = "description"
}

variable "instance_types" {
  type        = list(string)
  # length = 3
  # index =         0             1           2
  default     = ["t2.micro", "t2.small", "t2.large"]
  description = "description"
}

count.[0] = "t2.micro"
count.[1] = "t2.small"
count.[2] = "t2.large"

resource "aws_instance" "prod_instance" {
  count = 3

  ami_id = "ami-20e8w97ew78"
  instance_type = "t2.small"
}

resource "aws_instance" "stage_instance" {
  count = var.desired_capacity

  ami_id = "ami-20e8w97ew78"
  instance_type = "t2.small"
}

resource "aws_instance" "dev_instance" {
  count = length(var.instance_types)

  ami_id = "ami-20e8w97ew78"
  instance_type = var.instance_types[count.index]
  #instance_type = var.instance_types[0]
}


