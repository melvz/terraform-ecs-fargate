# terraform-ecs-fargate
- This is my personal project to demonstrate a simple NodeJS app, being instantiated using ECS-Fargate via Terraform.
- I made a custome app to go above and beyond a simple 'hello-world'.
- I re-used a simple NodeJS app to have extra fun!



### Workspace file
- Im a big fan of terraform workspace to avoid any mixup of environments.  
- But today's use case uses a lone env varfile located under the "workspace" folder.  
- File "vpc.tfvars" defines a /16 cidr for the VPC to use.
- 3 public subnets
- 3 private subnets


### ecs.tf
- Instantiates an ECS task definition using Fargate which defines my custom container app -->  "chuarm/nodejsweatherapp1-melvin"
- Instantiates an ECS service definition
- Instantiates an ECS cluster definition


### loadbalancer.tf
- I use alb instead of regular lb.
- target group listens to requests at port 80 with no SSL support (http only), while 'forwards' requests to container at port 8080.
- supports Fargate target type = "ip".


