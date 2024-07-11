# terraform-ec2-base

 This repository contains the Terraform code to create simple infrastructure in AWS around EC2 instance.
 
## Modules ⚡
- `backend` - This module creates a VPC, Subnet, Security Group, S3 bucket and EC2 instance.
- `frontend` - This module creates a S3 bucket, CloudFront distribution and ACM certificate.
- `registry` - This module creates an ECR repository.

VPC is created with external module `terraform-aws-modules/vpc/aws`.

## Environments 🛠️
By default, repository contains only `production` environment. You can create new environment by copying the `production`
directory and changing specific variables.

## How to use 🚀
1. Clone the repository
2. Change directory to the environment you want to use (create new if needed)
3. Add `terraform.tfvars` file with necessary variables in the environment directory
4. Setup proper bucket for Terraform state in `01_provider.tf` file
5. Run `terraform init` to initialize the environment
6. Run `terraform plan` to create an execution plan
7. Run `terraform apply` to apply the changes with auto-approve

## TODO 📝
- [x] Add Frontend module
- [ ] Add Route53 module
- [ ] Add Lambda module
- [ ] Setup CI/CD pipeline
