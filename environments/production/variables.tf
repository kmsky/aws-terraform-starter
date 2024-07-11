variable "region" {
    description = "The region in which the resources will be created"
    type        = string
}

variable "project_name" {
    description = "The name of the project"
    type        = string
}

# VPC / networking
# ---------------------------------------------------------------------------
variable "main_network_group" {
  description = "VPC networking IP address - first byte"
  default     = "30"
}

variable "secondary_network_group" {
  description = "VPC networking IP address - second byte"
  default     = "10"
}

# EC2
# ---------------------------------------------------------------------------
variable "ec2_instance_type" {
    description = "The type of EC2 instance to launch"
    type        = string
    default     = "t2.micro"
}

variable "ec2_ami" {
    description = "The AMI to use for the EC2 instance"
    type        = string
    default     = "ami-04f1b917806393faa"
}

variable "ec2_public_key" {
    description = "The public key to use for the EC2 instance"
    type        = string
}

# Frontend
# ---------------------------------------------------------------------------
variable "domain_name" {
    description = "The domain name for the frontend"
    type        = string
}

variable "route53_zone_id" {
    description = "The Route53 zone ID"
    type        = string
}

locals {
    availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
    vpc_cidr_block = "${var.main_network_group}.${var.secondary_network_group}.0.0/16"
}