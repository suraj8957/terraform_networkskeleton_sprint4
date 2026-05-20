# =========================================
# PRIVATE ROUTE TABLE
# =========================================
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.dev_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-private-route-table"
    }
  )
}
# =========================================
# FRONTEND SUBNET ASSOCIATION
# =========================================

resource "aws_route_table_association" "frontend_subnet_association" {

  subnet_id = aws_subnet.frontend_subnet.id

  route_table_id = aws_route_table.private_route_table.id
}

# =========================================
# BACKEND SUBNET ASSOCIATION
# =========================================

resource "aws_route_table_association" "backend_subnet_association" {

  subnet_id = aws_subnet.backend_subnet.id

  route_table_id = aws_route_table.private_route_table.id
}

# =========================================
# MIDDLEWARE SUBNET ASSOCIATION
# =========================================

resource "aws_route_table_association" "middleware_subnet_association" {

  subnet_id = aws_subnet.middleware_subnet.id

  route_table_id = aws_route_table.private_route_table.id
}

# =========================================
# DATABASE SUBNET ASSOCIATION
# =========================================

resource "aws_route_table_association" "database_subnet_association" {

  subnet_id = aws_subnet.database_subnet.id

  route_table_id = aws_route_table.private_route_table.id
}