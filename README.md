# terraform-ecs-fargate
- This is my personal project to demonstrate a simple NodeJS app, being instantiated using ECS-Fargate via Terraform.



### Workspace file
- Im a big fan of terraform workspace to avoid any mixup of environments.  
- But today's use case uses a lone env varfile located under the "workspace" folder.  
- File "vpc.tfvars" defines a /16 cidr for the VPC to use.
- 3 public subnets
- 3 private subnets


### ecs.tf