resource "aws_autoscaling_group" "example" {
  name                 = "example-asg"
  launch_configuration = aws_launch_configuration.example.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.example_subnet
  
  tag {
    key                 = "Name"
    value               = "example-asg"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_policy" "example" {
  autoscaling_group_name = aws_autoscaling_group.example.name
  name                   = "CpuTrackingPolicy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 70.0
    
  }

}



resource "aws_launch_configuration" "example" {
  image_id          = var.ami_id
  instance_type     = var.instance_type
  security_groups   = [aws_security_group.example.id,]
  iam_instance_profile = var.instance_profile
}

# Security group resource definition here
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Security group for EC2 instances"
  vpc_id   = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "vpc_id" {
    default = ""
  
}