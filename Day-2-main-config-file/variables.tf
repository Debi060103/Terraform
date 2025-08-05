variable "ami-id" {
  description = "inserting value in this"
  type = string
  default ="ami-08a6efd148b1f7504"
}

variable "type" {
    description = "instance type inserting in main.tf"
    type = string
    default = "t3.micro"
  
}