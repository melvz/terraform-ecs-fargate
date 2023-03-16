#from fork:
#https://gitlab.com/melvz168/tf-ecs-nodejsweatherapp-melvz-app

## ECS Task definition using FARGATE:
resource "aws_ecs_task_definition" "nodejsweatherapp_melvz" {
  family                   = "nodejsweatherapp-melvz-app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 2048
  memory                   = 2048

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
        "containerPort": 8080,
        "hostPort": 8080
      }
    ]
  }
]
DEFINITION
}




## ECS cluster definition:
resource "aws_ecs_cluster" "nodejsweatherapp_melvz" {
  name = "nodejsweatherapp-melvz-cluster"
  tags = {
    name = "terraform-ecs-cluster"
  }
}


## ECS service definition:
resource "aws_ecs_service" "nodejsweatherapp_melvz" {
  name            = "nodejsweatherapp-melvz-service"
  cluster         = aws_ecs_cluster.nodejsweatherapp_melvz.id
  task_definition = aws_ecs_task_definition.nodejsweatherapp_melvz.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = [aws_security_group.ecs_sg.id]
    subnets = module.vpc.private_subnets
    #subnets         = aws_subnet.private.*.id
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.ecs_target_grp.id
    container_name   = "nodejsweatherapp-melvz-app"
    container_port   = 8080
  }

  depends_on = [aws_alb_listener.alb_listener]
}







####
