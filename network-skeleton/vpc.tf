resource "aws_vpc" "dev_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-vpc-ot-ms"
    }
  )

}