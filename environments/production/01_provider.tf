provider "aws" {
  region  = var.region

  default_tags {
    tags = {
      project     = var.project_name
      managedby   = "terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "example-terraform-state"
    key    = "example-terraform-state/project/terraform.tfstate"
    region = "eu-central-1"
  }
}