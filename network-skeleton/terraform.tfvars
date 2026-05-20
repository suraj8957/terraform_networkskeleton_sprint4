############### VPC ########################
region      = "us-east-1"
vpc_cidr    = "10.0.0.0/16"
environment = "dev"
application = "Network-Skeleton"
owner       = "Suraj"
costcenter  = "OT-MICRO-2026e"

############### Subnet ###########################

public_subnet_az1_cidr   = "10.0.1.0/24"
public_az1_region        = "us-east-1a"
public_subnet_az2_cidr   = "10.0.2.0/24"
public_az2_region        = "us-east-1b"
frontend_subnet_cidr     = "10.0.5.0/24"
frontend_subnet_region   = "us-east-1a"
backend_subnet_cidr      = "10.0.9.0/24"
backend_subnet_region    = "us-east-1a"
middleware_subnet_cidr   = "10.0.12.0/24"
middleware_subnet_region = "us-east-1a"
database_subnet_cidr     = "10.0.16.0/24"
database_subnet_region   = "us-east-1a"

############### Bastion Instance ###########################
bastion_ami           = "ami-0a02d9ac173888fb4"
bastion_instance_type = "t3.micro"

####################### Load Balancer ###################

alb_name = "dev-alb"

####################### Route53 ###################

domain_name    = "gaganawasthi.online"
subdomain_name = "dev"