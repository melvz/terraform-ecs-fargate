#-------------------------------
# Create a VPC
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws
#-------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"

  name = format("trivutmarketplace-%s-vpc", terraform.workspace)
  cidr = var.vpc_cidr
  azs  = var.vpc_azs

  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  enable_nat_gateway   = false
  single_nat_gateway   = false
  enable_dns_hostnames = false
  enable_dns_support   = false

  map_public_ip_on_launch = false

  // applies to all provisioned resources
  tags = {
    Project     = var.tag_project_name
    Workspace   = terraform.workspace
    Managed_by  = "Terraform"
  }
}



