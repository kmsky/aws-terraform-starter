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
}

variable "secondary_network_group" {
  description = "VPC networking IP address - second byte"
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
}

variable "ec2_public_key" {
    description = "The public key to use for the EC2 instance"
    type        = string
}


locals {
    availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
    vpc_cidr_block = "${var.main_network_group}.${var.secondary_network_group}.0.0/16"
}