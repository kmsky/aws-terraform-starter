# terraform-ec2-base

 This repository contains the Terraform code to create simple infrastructure in AWS around EC2 instance.
 
## Modules ⚡
- `basic` - This module creates a VPC, Subnet, Security Group, S3 bucket and EC2 instance.
- `registry` - This module creates an ECR repository.

VPC is created with external module `terraform-aws-modules/vpc/aws`.

## Environments 🛠️
By default, repository contains only `production` environment. You can create new environment by copying the `production`
directory and changing specific variables.

## How to use 🚀
1. Clone the repository
2. Add new environment directory or use existing one (`production`)
3. Add `terraform.tfvars` file with necessary variables
4. Setup proper bucket for Terraform state in `01_provider.tf` file
5. Run `make init` to initialize the working directory
6. Run `make plan` to create an execution plan
7. Run `make apply` to apply the changes with auto-approve

## TODO 📝
- [ ] Add Route53 module
- [ ] Add Lambda module
- [ ] Setup CI/CD pipeline
