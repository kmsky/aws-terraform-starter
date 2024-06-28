module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "${var.project_name}-vpc"
  cidr = "${local.vpc_cidr_block}"

  azs             = local.availability_zones
  private_subnets = [
    "${var.main_network_group}.${var.secondary_network_group}.1.0/24",
  ]
  public_subnets = [
    "${var.main_network_group}.${var.secondary_network_group}.11.0/24",
  ]

  private_subnet_tags = {
    Type = "private"
  }
  public_subnet_tags = {
    Type = "public"
  }
  enable_nat_gateway = false

  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  tags = {
    project = var.project_name
  }
}