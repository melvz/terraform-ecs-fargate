# terraform-ecs-fargate
- This is my personal project to demonstrate a simple NodeJS app, being instantiated using ECS-Fargate via Terraform.
- I made a custom app to go above and beyond a simple 'hello-world'.
- I re-used a simple NodeJS app to have extra fun!  This custom image is defined in ECS/Fargate Container Definition:
```json
container_definitions = <<DEFINITION
[
  {
    "image": "chuarm/nodejsweatherapp1-melvin",
    "cpu": 1024,
    "memory": 2048,
    "name": "nodejsweatherapp-melvz-app",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ]
  }
]
DEFINITION
//Thanks to my source:  https://github.com/bmorelli25/simple-nodejs-weather-app  
```

- For exercise STEP1 -  I took the liberty to create my own custom NodeJS image, where I re-used some opensource components:
```bash
docker pull chuarm/nodejsweatherapp1-melvin:latest
```
- For STEP2, please see the steps below.  Cheers!


### Workspace file
- Im a big fan of terraform workspace to avoid any mixup of environments.  
- But today's use case has a lone env varfile located under the "workspace" folder.  
- Feel free to use the varfile:
```bash
terraform plan -lock=false -var-file=workspace/ecs-iteration-1/vpc.tfvars
```

- File "vpc.tfvars" defines a  '/16'  cidr for the VPC to use.
- 3 public subnets.
- 3 private subnets.




### Define the ECS Fargate cluster using the ecs.tf file:
- Instantiates an ECS task definition using Fargate which defines my custom container app -->  "chuarm/nodejsweatherapp1-melvin".
- My custom app was built using a Dockerfile that exposes service at port 8080.
- Instantiates an ECS service definition which points to the 'cluster' definition, the needed subnets and the loadbalancer.
- Instantiates an ECS cluster definition.




### We need a loadbalancer where ECS will exist -->  loadbalancer.tf
- I use alb instead of regular lb.
- ALB listens to requests at port 80 with no SSL support (http only), while the ALB 'forwards' requests to container at port 8080.
- Supports Fargate target type = "ip".



### Traffic flow:
- Inbound traffic from outside world (internet) hits the ALB (loadbalancer) at port 80 (allowed by alb_sg).
- Traffic from ALB will hit port 8080 into the ECS/Fargate service, which sits on private subnets.  
- 
---


### Use Github Actions to execute Terraform commands :
- Please find the actions file under .github folder.
- Setup your own secrets and actions' env variables.

~



