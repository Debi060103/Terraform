resource "aws_instance" "cust" {
 ami = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  tags = {
    Name="ec2"
  }
}