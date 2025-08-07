resource "aws_instance" "dev" {
  ami = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  tags = {
    Name="ec2"
  }
 iam_instance_profile = "ec2-s3"
}