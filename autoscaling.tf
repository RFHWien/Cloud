# R4: Autoscaling based on 50 percent CPU utilization

resource "aws_autoscaling_group" "web" {
  name             = "web-asg"
  min_size         = 1
  max_size         = 4
  desired_capacity = 1

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "cpu_target" {
  name                   = "cpu-50-percent"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50
  }
}
