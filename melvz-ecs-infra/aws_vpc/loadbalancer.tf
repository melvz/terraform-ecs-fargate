resource "aws_alb" "web_alb" {
  name = "web-alb"
  security_groups = [aws_security_group.ecs_sg.id]
  subnets = module.vpc.private_subnets

  #cross_zone_load_balancing   = true

}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = aws_alb.web_alb.arn
  port              = "80"  
  protocol          = "HTTP"
  
  default_action {    
    target_group_arn = aws_alb_target_group.ecs_target_grp.arn
    type             = "forward"  
  }
}

resource "aws_alb_target_group" "ecs_target_grp" {  
  name     = "ecs-target-grp"
  port     = "8080"  
  protocol = "HTTP"  
  vpc_id   = module.vpc.vpc_id
  target_type = "ip"
     
  
}
