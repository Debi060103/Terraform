provider "aws" {
  
}




resource "aws_instance" "name" {
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    user_data = file("test.sh")
    tags = {
      Name="ec2"
    }
   
}