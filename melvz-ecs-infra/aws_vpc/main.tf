#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region  = var.aws_region
}

#-------------------------------
# S3 Remote State
#-------------------------------
terraform {
  backend "s3" {
    bucket         = "statebucket-melvz"
    key            = "melvz-vpc.tfstate"
    region         = "us-west-2"
    dynamodb_table = "melvz-tf-lock"
  }
  
}

### end of main.tf ###
