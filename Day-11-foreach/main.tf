provider "aws" {
  
}

resource "aws_instance" "name" {
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    # count = length(var.ec2)
    for_each = toset(var.ec2)
    tags = {
      Name = each.value
    }
  
}

variable "ec2" {
    type = list(string)
    default = [ "dev", "test" , "prod", "preprod" ]
  
}