provider "aws" {
  
}

module "test" {
  source = "../Day-7-moduls-resource"
  ami-id="ami-08a6efd148b1f7504"
  instance-type = "t3.micro"
}