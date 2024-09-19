# VPC
resource "aws_vpc" "customthreads_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "customthreads-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "customthreads_igw" {
  vpc_id = aws_vpc.customthreads_vpc.id

  tags = {
    Name = "customthreads-igw"
  }
}

# Subnets
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.customthreads_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "customthreads-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.customthreads_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "customthreads-private-subnet-${count.index + 1}"
  }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.customthreads_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.customthreads_igw.id
  }

  tags = {
    Name = "customthreads-public-rt"
  }
}

# Route Table Association
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group for Web Servers
resource "aws_security_group" "web_sg" {
  name        = "customthreads-web-sg"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.customthreads_vpc.id

  ingress {
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
    Name = "customthreads-web-sg"
  }
}

# Security Group for Database
resource "aws_security_group" "db_sg" {
  name        = "customthreads-db-sg"
  description = "Security group for database"
  vpc_id      = aws_vpc.customthreads_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  tags = {
    Name = "customthreads-db-sg"
  }
}

# EC2 Instances
resource "aws_instance" "web_servers" {
  count                  = var.web_server_count
  ami                    = var.ami_id
  instance_type          = var.instance_type_map[var.environment]
  subnet_id              = aws_subnet.public_subnets[count.index % length(var.public_subnet_cidrs)].id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to CustomThreads</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "customthreads-web-server-${count.index + 1}"
  }
}

# Elastic Load Balancer
resource "aws_lb" "web_lb" {
  name               = "customthreads-web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = aws_subnet.public_subnets[*].id

  tags = {
    Name = "customthreads-web-lb"
  }
}

resource "aws_lb_target_group" "web_tg" {
  name     = "customthreads-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.customthreads_vpc.id

  health_check {
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 10
  }
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "web_tg_attachment" {
  count            = length(aws_instance.web_servers)
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = aws_instance.web_servers[count.index].id
  port             = 80
}

# RDS Instance
resource "aws_db_instance" "customthreads_db" {
  identifier           = "customthreads-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "customthreads"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.customthreads_db_subnet_group.name

  tags = {
    Name = "customthreads-db"
  }
}

resource "aws_db_subnet_group" "customthreads_db_subnet_group" {
  name       = "customthreads-db-subnet-group"
  subnet_ids = aws_subnet.private_subnets[*].id

  tags = {
    Name = "CustomThreads DB Subnet Group"
  }
}