
resource "aws_instance" "name" {
  ami = var.ami-id
 instance_type = var.instance-type
 tags = {
   Name="ec2"
 }
}