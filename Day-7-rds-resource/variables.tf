# vpc value
variable "vpc-cidr" {
  type = string
  default = ""
}

variable "vpc-name" {
  type = string
  default = ""
}

# subnet value
# variable "subnet-cidr" {
#   type = string
#   default = ""
# }

# variable "subnet-AZ" {
#   type = string
#   default = ""
# }

# variable "subnet-name" {
#   type = string
#   default = ""
# }
variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    cidr_block = string
    az         = string
    name       = string
  }))
}


# igw

variable "igw-name" {
  type = string
  default = ""
}

# rt 

variable "rt-cidr" {
  type = string
  default = ""
}
variable "rt-name" {
  type = string
  default = ""
}

# subnet group
variable "subnet-g-name" {
  type = string
  default = ""
}

# sg
variable "sg-name" {
  type = string
  default = ""
}

variable "sg-description" {
  type = string
  default = ""
}

variable "sg-ingress-description" {
  type = string
  default = ""
}
variable "sg-ingress-from-port" {
  type = number
  default = null
}
variable "sg-ingress-to-port" {
  type = number
  default = null
}
variable "sg-ingress-protocol" {
  type = string
  default = ""
}
variable "sg-ingress-cidr" {
  type = string
  default = ""
}

variable "sg-egress-from-port" {
  type = number
  default = null
}
variable "sg-egress-to-port" {
  type = number
  default = null
}
variable "sg-egress-protocol" {
  type = string
  default = ""
}
variable "sg-egress-cidr" {
  type = string
  default = ""
}

# rds creation
variable "rds-identifier" {
  type = string
  default = ""
}
variable "rds-engine" {
  type = string
  default = ""
}
variable "rds-engine-version" {
  type = string
  default = ""
}
variable "rds-instance-class" {
  type = string
  default = ""
}
variable "rds-storage" {
  type = number
  default = null
}
variable "rds-db-name" {
  type = string
  default = ""
}
variable "rds-user-name" {
  type = string
  default = ""
}
variable "rds-password" {
  type = string
  default = ""
}
variable "rds-para-gp-name" {
  type = string
  default = ""
}
variable "rds-f-snap" {
  type = bool
  default = null
}
variable "rds-pub-acc" {
  type = bool
  default = null
}
variable "rds-name" {
  type = string
  default = ""
}











