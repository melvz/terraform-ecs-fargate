#-------------------------------
# AWS Provider
#-------------------------------
provider "aws" {
  region  = var.aws_region
  #version = "~> 2.65.0"
}

#-------------------------------
# S3 Remote State
#-------------------------------
terraform {
  backend "s3" {
    bucket         = "statebucket-trivut-marketplace"
    key            = "trivut-marketplace-vpc.tfstate"
    region         = "us-west-2"
    dynamodb_table = "symbol-tf-lock"
  }
  
}


#
#
#
data "aws_caller_identity" "current" {}

resource "aws_kms_key" "cmk" {
  description = "master key"

  policy = <<EOF
{
  "Version" : "2012-10-17",
  "Id" : "key-default-1",
  "Statement" : [ {
      "Sid" : "Enable IAM User Permissions",
      "Effect" : "Allow",
      "Principal" : {
        "AWS" : "arn:aws:iam::data.aws_caller_identity.current.account_id:trivut-aws-melvin"
      },
      "Action" : "kms:*",
      "Resource" : "*"
    },
    {
      "Effect": "Allow",
      "Principal": { "Service": "logs.var.region.amazonaws.com" },
      "Action": [ 
        "kms:Encrypt*",
        "kms:Decrypt*",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:Describe*"
      ],
      "Resource": "*"
    }  
  ]
}
EOF

  
}

### end of main.tf ###
