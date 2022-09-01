resource "aws_lb" "msvpc-alb-01" {
  name               = "msvpc-alb-01"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.msvpc-sg-allow-all.id]
  subnets            = [aws_subnet.msvpc-subnet-01.id, aws_subnet.msvpc-subnet-02.id]

  enable_deletion_protection = false
}

resource "aws_lb_listener" "msvpc-lb-listener" {
  load_balancer_arn = aws_lb.msvpc-alb-01.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.msvpc-lb-tg-01.arn
  }
}