# vpc-cidr ="10.0.0.0/16"
# vpc-name = "cust_vpc"

# subnet-cidr ="10.0.1.0/24"
# subnet-AZ ="us-east-1a"
# subnet-name ="subnet-1"

# subnets = [
#   {
#     cidr_block = "10.0.1.0/24"
#     az         = "ap-south-1a"
#     name       = "public-subnet-1"
#   },
#   {
#     cidr_block = "10.0.2.0/24"
#     az         = "ap-south-1b"
#     name       = "public-subnet-2"
#   }
# ]

# igw-name ="cust_IGW"
# rt-cidr = "0.0.0.0/0"
# rt-name ="cust-rt"
# subnet-g-name ="my-db-subnet-group"
# sg-name ="My DB Subnet Group"
# sg-description ="Allow MySQL traffic"
# sg-ingress-description ="MySQL from EC2"
# sg-ingress-from-port =3306
# sg-ingress-to-port =3306
# sg-ingress-protocol ="tcp"
# sg-ingress-cidr ="10.0.0.0/16"
# sg-egress-from-port =0
# sg-egress-to-port =0
# sg-egress-protocol ="-1"
# sg-egress-cidr ="0.0.0.0/0"
# rds-identifier = "mydb-instance"
# rds-engine ="mysql"
# rds-engine-version ="8.0"
# rds-instance-class ="db.t3.micro"
# rds-storage =20
# rds-db-name ="Cust_database"
# rds-user-name ="admin"
# rds-password = "database1"
# rds-para-gp-name ="default.mysql8.0"
# rds-f-snap =true
# rds-pub-acc =false
# rds-name ="My_RDS_Instance"