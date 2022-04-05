################################################################################
# Security Group for the ECS Cluster
################################################################################
resource "aws_security_group" "ecs_sg" {
  name        = format("trivutmarketplace-%s-ecs-sg", var.tag_project_name)
  description = format("Security group for the %s ECS nodes", var.tag_project_name)
  vpc_id      = module.vpc.vpc_id

  

  // Allow Global HTTP Access into port 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = format("Global %s service HTTP port Ingress Access", var.tag_project_name)
  }


  // Allow Global HTTP Access into port 8080
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = format("Global %s service HTTP port Ingress Access", var.tag_project_name)
  }
    
    
  // Allow Global HTTPS Access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = format("Global %s service HTTPS port Ingress Access", var.tag_project_name)
  }


  // Allow Global Outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = format("trivutmarketplace-%s-ecs-sg", var.tag_project_name)
    Project     = var.tag_project_name
    Environment = "Service"
    Workspace   = terraform.workspace
    Managed_by  = "Terraform"
  }
}
