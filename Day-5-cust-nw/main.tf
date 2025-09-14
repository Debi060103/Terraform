# Creation of vpc
resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr
  tags = {
    Name="cust_vpc"
  }
}

# Create subnet
resource "aws_subnet" "pub" {
  vpc_id = aws_vpc.dev.id
  cidr_block = var.pub_sub_cidr
  tags = {
    Name="public_subnet"
  }
}

resource "aws_subnet" "pvt" {
  vpc_id = aws_vpc.dev.id
  cidr_block = var.pvt_sub_cidr
  tags = {
    Name="private_subnet"
  }
}

# create igw
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.dev.id
  tags = {
    Name="cust_IGW"
  }
}




# create nat
resource "aws_nat_gateway" "name" {
  subnet_id = aws_subnet.pvt.id
  connectivity_type = "public"
}


# creation of rt
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.dev.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
}

# Creation of subnet association
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.pub.id
  route_table_id = aws_route_table.name.id
}

# Creating sg
resource "aws_security_group" "name" {
  description = "allow"
  vpc_id = aws_vpc.dev.id
  tags={
    Name="cust_sg"
  }
}

# create a instance
resource "aws_instance" "name" {
  ami = var.ami-id
  instance_type = var.instance_type
  tags = {
    Name="ec2"
  }
  subnet_id = aws_subnet.pub.id
  vpc_security_group_ids = [aws_security_group.name.id]
}

