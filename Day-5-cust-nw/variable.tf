variable "ami-id" {
  description = "inserting value in this"
  type = string
  default =""
}

variable "instance_type" {
  type = string
  default = ""
}

variable "vpc_cidr" {
  type = string
  default = "value"
}

variable "pub_sub_cidr" {
  type = string
  default = ""
}

variable "pvt_sub_cidr" {
  type = string
  default = ""
}

variable "subnet" {
  type = number
  default = null
}
