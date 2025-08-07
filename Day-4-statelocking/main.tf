resource "aws_instance" "cust" {
 ami = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  tags = {
    Name="ec2"
  }
}

resource "aws_vpc" "cust" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="cust_vpc"
  }
}