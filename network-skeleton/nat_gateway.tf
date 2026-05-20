# =========================================
# ELASTIC IP
# =========================================

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-nat-eip"
    }
  )
}

# =========================================
# NAT GATEWAY
# =========================================

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-nat-gateway"
    }
  )
  depends_on = [aws_internet_gateway.igw]
}
