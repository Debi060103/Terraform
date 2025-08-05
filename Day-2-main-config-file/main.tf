resource "aws_instance" "name" {
  ami = var.ami-id
  instance_type = var.type
  tags = {
    Name="ec2"
  }
}