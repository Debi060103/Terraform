terraform {
  backend "s3" {
    bucket = "whyilu"
    key = "errored.tfstate"
    region = "us-east-1"
  }
}