resource "aws_instance" "name" {
   ami = "ami-08a6efd148b1f7504"
   instance_type = "t3.micro"
   tags={
    Name="ec2"
   }

   lifecycle {
     prevent_destroy = true
   }
}