terraform {
  backend "s3" {
    bucket = "whyilu"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}