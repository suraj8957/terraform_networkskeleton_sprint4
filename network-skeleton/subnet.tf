# ==============================
# public subnet 1 (AZ-1)
#===============================

resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = var.public_az1_region
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-public-subnet-az1"
    }
  )
}

# ==============================
# public subnet 2 (AZ-2)
#===============================

resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = var.public_az2_region
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-public-subnet-az2"
    }
  )

}

#==============================
# Frontend Subnet 
#===============================

resource "aws_subnet" "frontend_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.frontend_subnet_cidr
  availability_zone       = var.frontend_subnet_region
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-frontend-subnet"
    }
  )

}

# ==============================
# Backend Subnet 
#===============================

resource "aws_subnet" "backend_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.backend_subnet_cidr
  availability_zone       = var.backend_subnet_region
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-backend-subnet"
    }
  )

}

# ==============================
# Middleware subnet 
#===============================

resource "aws_subnet" "middleware_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.middleware_subnet_cidr
  availability_zone       = var.middleware_subnet_region
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-middleware-subnet"
    }
  )

}

# ==============================
# Database subnet 
#===============================

resource "aws_subnet" "database_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.database_subnet_cidr
  availability_zone       = var.database_subnet_region
  map_public_ip_on_launch = false

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-database-subnet"
    }
  )

}