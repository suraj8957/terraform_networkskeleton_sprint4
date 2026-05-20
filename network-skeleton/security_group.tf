# =========================================
# ALB SECURITY GROUP
# =========================================

resource "aws_security_group" "alb_sg" {
  name        = "${var.environment}-alb-sg"
  description = "ALB security group"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {

    description = "HTTPS"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-alb-sg"
    }
  )

}

# =========================================
# BASTION SECURITY GROUP
# =========================================

resource "aws_security_group" "bastion_sg" {
  name        = "${var.environment}-bastion-sg"
  description = "Bastion Security group"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    description = "SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-bastion-sg"
    }
  )
}
# =========================================
# FRONTEND SECURITY GROUP
# =========================================
resource "aws_security_group" "frontend_sg" {
  name        = "${var.environment}-frontend-sg"
  description = "Frontend security group"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {

    description = "HTTP from ALB"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {

    description = "SSH from Bastion"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-frontend-sg"
    }
  )

}

# =========================================
# BACKEND SECURITY GROUP
# =========================================

resource "aws_security_group" "backend_sg" {

  name = "${var.environment}-backend-sg"

  description = "Backend Security Group"

  vpc_id = aws_vpc.dev_vpc.id

  ingress {

    description = "Backend API from Frontend"

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    security_groups = [aws_security_group.frontend_sg.id]
  }

  ingress {

    description = "SSH from Bastion"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-backend-sg"
    }
  )
}

# =========================================
# MIDDLEWARE SECURITY GROUP
# =========================================

resource "aws_security_group" "middleware_sg" {

  name = "${var.environment}-middleware-sg"

  description = "Middleware Security Group"

  vpc_id = aws_vpc.dev_vpc.id

  ingress {

    description = "Redis"

    from_port = 6379

    to_port = 6379

    protocol = "tcp"

    security_groups = [aws_security_group.backend_sg.id]
  }

  ingress {

    description = "Kafka"

    from_port = 9092

    to_port = 9092

    protocol = "tcp"

    security_groups = [aws_security_group.backend_sg.id]
  }

  ingress {

    description = "Elasticsearch"

    from_port = 9200

    to_port = 9200

    protocol = "tcp"

    security_groups = [aws_security_group.backend_sg.id]
  }

  ingress {

    description = "SSH from Bastion"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-middleware-sg"
    }
  )
}

# =========================================
# DATABASE SECURITY GROUP
# =========================================

resource "aws_security_group" "database_sg" {

  name = "${var.environment}-database-sg"

  description = "Database Security Group"

  vpc_id = aws_vpc.dev_vpc.id

  ingress {

    description = "PostgreSQL"

    from_port = 5432

    to_port = 5432

    protocol = "tcp"

    security_groups = [aws_security_group.backend_sg.id]
  }

  ingress {

    description = "ScyllaDB"

    from_port = 9042

    to_port = 9042

    protocol = "tcp"

    security_groups = [aws_security_group.backend_sg.id]
  }

  ingress {

    description = "SSH from Bastion"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-database-sg"
    }
  )
}
