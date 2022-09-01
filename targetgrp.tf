resource "aws_lb_target_group" "msvpc-lb-tg-01" {
  name     = "msvpc-lb-tg-01"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.msvpc-01.id
  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 6
    matcher             = 200
    path                = "/"
    port                = 80
  }
}