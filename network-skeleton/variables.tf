################# vpc ###########################
variable "region" {
  type        = string
  description = "AWS region"

}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "application" {
  type        = string
  description = "Application name"
}

variable "owner" {
  type        = string
  description = "Owner Name "
}

variable "environment" {
  type        = string
  description = "Environment"
}
variable "costcenter" {
  type        = string
  description = "Cost Center"

}

###################### subnet ################################

variable "public_subnet_az1_cidr" {
  type        = string
  description = "public subnet AZ1 CIDR"
}

variable "public_az1_region" {
  type        = string
  description = "public subnet AZ1 region"

}

variable "public_subnet_az2_cidr" {
  type        = string
  description = "public subnet AZ2 CIDR"

}

variable "public_az2_region" {
  type        = string
  description = "public subnet az2 region"

}

variable "frontend_subnet_cidr" {
  type        = string
  description = "Frontend subnet cidr"

}

variable "frontend_subnet_region" {
  type        = string
  description = "Frontend subnet region"

}

variable "backend_subnet_cidr" {
  type        = string
  description = "Backend subnet cidr"

}

variable "backend_subnet_region" {
  type        = string
  description = "Backend subnet region"

}

variable "middleware_subnet_cidr" {
  type        = string
  description = "Middleware subnet CIDR"

}

variable "middleware_subnet_region" {
  type        = string
  description = "Middleware subnet region"

}

variable "database_subnet_cidr" {
  type        = string
  description = "Database subnet CIDR"

}

variable "database_subnet_region" {
  type        = string
  description = "database subnet region"

}

####################### Bastion Instance ###################

variable "bastion_ami" {
  type        = string
  description = "AMI ID for Baston Host"
}

variable "bastion_instance_type" {
  type        = string
  description = "Instance type for Bastion host"
}

####################### Load Balancer ###################

variable "alb_name" {
  type        = string
  description = "Application load balancer name"
}

####################### Route53 ###################

variable "domain_name" {
  type        = string
  description = "Domain Name"
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain Name"
}