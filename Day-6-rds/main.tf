provider "aws" {
  
}

# create vpc
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="cust_vpc"
  }
}

# create 2 subnet
resource "aws_subnet" "cust_1" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name="subnet-1"
  }
}

resource "aws_subnet" "cust_2" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name="subnet-2"
  }
}

# create igw
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
  tags = {
    Name="cust_IGW"
  }
}

# creation of rt
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
}

# Creation of subnet association
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.cust_1.id
  route_table_id = aws_route_table.name.id
}



# 1. Create a DB subnet group
resource "aws_db_subnet_group" "default" {
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.cust_1.id,aws_subnet.cust_2.id] # Replace with your subnet IDs

  tags = {
    Name = "My DB Subnet Group"
  }
}

# 2. Create a Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL traffic"
  vpc_id      = aws_vpc.name.id # Replace with your VPC ID

  ingress {
    description = "MySQL from EC2"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Allow only internal network
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. Create the RDS instance
resource "aws_db_instance" "mydb" {
  identifier             = "mydb-instance"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro" # Free-tier eligible
  allocated_storage      = 20
  db_name                = "Cust_database"
  username               = "admin"
  password               = "database1" # Use Secrets Manager in production
  parameter_group_name   = "default.mysql8.0"
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
#   publicly_accessible = true

  tags = {
    Name = "My_RDS_Instance"
  }
}
