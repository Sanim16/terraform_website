resource "aws_autoscaling_group" "msvpc-asg-01" {
  vpc_zone_identifier = [aws_subnet.msvpc-subnet-01.id, aws_subnet.msvpc-subnet-02.id]
  name                = "msvpc-asg-01"
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  default_cooldown    = 120

  target_group_arns = [aws_lb_target_group.msvpc-lb-tg-01.arn]
  health_check_type = "ELB"

  #   lifecycle {
  #     ignore_changes = [load_balancers, target_group_arns]
  #   }

  launch_template {
    id      = aws_launch_template.msvpc-lt-01.id
    version = "$Latest"
  }

  depends_on = [
    aws_launch_template.msvpc-lt-01
  ]
}