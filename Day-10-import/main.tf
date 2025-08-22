provider "aws" {
  
}

resource "aws_instance" "name" {
  ami = "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  tags = {
    Name="ec2"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "ddgfjhkkjkh"
}

resource "aws_iam_user" "name" {
name= "user-1"
tags = {
  Name="user-1"
}
}