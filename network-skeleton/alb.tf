# =========================================
# APPLICATION LOAD BALANCER
# =========================================

resource "aws_alb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets = [
    aws_subnet.public_subnet_az1.id,
    aws_subnet.public_subnet_az2.id
  ]
  enable_deletion_protection = false
  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-alb"
    }
  )
}