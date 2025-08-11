
# create vpc
resource "aws_vpc" "name" {
  cidr_block = var.vpc-cidr
  tags = {
    Name=var.vpc-name
  }
}

# create 2 subnet
# resource "aws_subnet" "cust_1" {
#   vpc_id = aws_vpc.name.id
#   cidr_block = var.subnet-cidr
#   availability_zone = var.subnet-AZ
#   tags = {
#     Name=var.subnet-name
#   }
# }

# resource "aws_subnet" "cust_2" {
#   vpc_id = aws_vpc.name.id
#   cidr_block = var.subnet-cidr
#   availability_zone = var.subnet-AZ
#   tags = {
#     Name=var.subnet-name
#   }
# }

resource "aws_subnet" "cust" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }

  vpc_id                  = aws_vpc.name.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = each.value.name
  }
}

# create igw
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
  tags = {
    Name=var.igw-name
  }
}

# creation of rt
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
    route {
    cidr_block = var.rt-cidr
    gateway_id = aws_internet_gateway.name.id
  }
  tags = {
    Name=var.rt-name
  }
}

# Creation of subnet association
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.cust["0"].id
  route_table_id = aws_route_table.name.id
}



# 1. Create a DB subnet group
resource "aws_db_subnet_group" "default" {
  name       = var.subnet-g-name
  subnet_ids = [for s in aws_subnet.cust : s.id]
   # Replace with your subnet IDs

  tags = {
    Name = var.subnet-g-name
  }
}

# 2. Create a Security Group for RDS
resource "aws_security_group" "rds_sg" {
  description = var.sg-description
  vpc_id      = aws_vpc.name.id # Replace with your VPC ID

  ingress {
    description = var.sg-ingress-description
    from_port   =var.sg-ingress-from-port
    to_port     =var.sg-ingress-to-port
    protocol    = var.sg-ingress-protocol
    cidr_blocks = [var.sg-ingress-cidr] # Allow only internal network
  }

  egress {
    from_port   = var.sg-egress-from-port
    to_port     = var.sg-egress-to-port
    protocol    = var.sg-egress-protocol
    cidr_blocks = [var.sg-egress-cidr]
  }
}

# 3. Create the RDS instance
resource "aws_db_instance" "mydb" {
  identifier             = var.rds-identifier
  engine                 = var.rds-engine
  engine_version         = var.rds-engine-version
  instance_class         = var.rds-instance-class # Free-tier eligible
  allocated_storage      = var.rds-storage
  db_name                = var.rds-db-name
  username               = var.rds-user-name
  password               = var.rds-password # Use Secrets Manager in production
  parameter_group_name   = var.rds-para-gp-name
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = var.rds-f-snap
#   publicly_accessible = var.rds-pub-acc

  tags = {
    Name = var.rds-name
  }
}
