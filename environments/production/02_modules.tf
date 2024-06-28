module "basic" {
  source = "../../modules/basic"

  region        = var.region
  project_name  = var.project_name

  main_network_group        = var.main_network_group
  secondary_network_group   = var.secondary_network_group

  ec2_instance_type   = var.ec2_instance_type
  ec2_ami             = var.ec2_ami
  ec2_public_key     = var.ec2_public_key
}

module "registry" {
    source = "../../modules/registry"

    project_name  = var.project_name
}