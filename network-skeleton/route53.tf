# =========================================
# ROUTE53 HOSTED ZONE
# =========================================

resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = merge(
    local.common_tags,
    {
      Name = "${var.environment}-hosted-zone"
    }
  )
}

# =========================================
# ROUTE53 CNAME RECORD
# =========================================

resource "aws_route53_record" "dev_record" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.subdomain_name}.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_alb.alb.dns_name]
}
