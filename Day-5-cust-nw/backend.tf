terraform {
  backend "s3" {
    bucket = "mainbkt"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}