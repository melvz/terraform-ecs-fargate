#---------------------
# AWS PROVIDER
#---------------------
variable "aws_region" {
  description = "AWS Set Region"
}

#---------------------
# VPC
#---------------------
variable "vpc_cidr" {
  description = "VPC CIDR Block"
}

variable "vpc_azs" {
  type        = list
  description = "VPC Availability Zones"
}

variable "vpc_public_subnets" {
  type        = list
  description = "VPC Public Subnets"
}

variable "vpc_private_subnets" {
  type        = list
  description = "VPC Private Subnets"
}



#---------------------
# General vars
#---------------------
variable "tag_project_name" {
  description = "Project Name"
}


