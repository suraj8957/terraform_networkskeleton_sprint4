#################### vpc ########################
output "vpc_id" {
  description = "VPC_ID"
  value       = aws_vpc.dev_vpc.id

}

####################### subnet ###################

output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

output "frontend_subnet_id" {
  value = aws_subnet.frontend_subnet.id
}

output "backend_subnet_id" {
  value = aws_subnet.backend_subnet.id
}

output "middleware_subnet_id" {
  value = aws_subnet.middleware_subnet.id
}

output "database_subnet_id" {
  value = aws_subnet.database_subnet.id
}

####################### Internet Gateway ###################

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id

}

####################### public route table ###################

output "public_route_table_id" {
  value = aws_route_table.public_route_table.id

}

####################### Nat Gateway ###################

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id

}

####################### private route table ###################

output "private_route_table_id" {
  value = aws_route_table.private_route_table.id

}

####################### security Group ###################

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id

}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id

}

output "frontend_sg_id" {
  value = aws_security_group.frontend_sg.id

}

output "backend_sg_id" {
  value = aws_security_group.backend_sg.id
}

output "middleware_sg_id" {
  value = aws_security_group.middleware_sg.id
}

output "database_sg_id" {
  value = aws_security_group.middleware_sg.id
}

####################### Key pair ###################

output "keypair_name" {
  description = "AWS key pair name"
  value       = aws_key_pair.dev_key.key_name
}

####################### Bastion Instance ###################

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

####################### Load Balancer ###################

output "alb_dns_name" {
  value       = aws_alb.alb.dns_name
  description = "Application load balancer dns name"
}

output "alb_arn" {
  value       = aws_alb.alb.arn
  description = "Application Load Balance ARN"
}

output "alb_zone_id" {
  description = "ALB hosted zone ID"
  value       = aws_alb.alb.zone_id
}

####################### Route53 ###################

output "router53_zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "route53_nameserver" {
  value = aws_route53_zone.main.name_servers
}

output "route53_record" {
  value = aws_route53_record.dev_record.fqdn
}