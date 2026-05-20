resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-igw"
    }
  )
}