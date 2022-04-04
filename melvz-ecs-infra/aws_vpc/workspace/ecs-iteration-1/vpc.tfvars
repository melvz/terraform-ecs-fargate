#---------------------
# AWS Provider Region
#---------------------
# Oregon
aws_region = "us-west-2"

#---------------------
# Gitlab CI/CD
#---------------------
# EMS Project Name
tag_project_name = "ecs-nodejs-melvz"

#---------------------
# VPC
#---------------------
# Main VPC CIDR block for Events Management System
# 10.13.0.0/16 (10.13.0.0 - 10.13.255.255) - 65,534 
vpc_cidr = "10.38.0.0/16"

vpc_azs = [
  "us-west-2a",
  "us-west-2b",
  "us-west-2c",
]

# Public subnet CIDR block range - 4094 Hosts/Net
vpc_public_subnets = [
  "10.38.0.0/20",
  "10.38.16.0/20",
  "10.38.32.0/20",
]

# Private subnet CIDR block range - 4096 Hosts/Net
vpc_private_subnets = [
  "10.38.48.0/20",
  "10.38.64.0/20",
  "10.38.80.0/20",
]



