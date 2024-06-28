# terraform-ec2-base

 This repository contains the Terraform code to create simple infrastructure in AWS around EC2 instance.
 
## Modules ⚡
- `basic` - This module creates a VPC, Subnet, Security Group, S3 bucket and EC2 instance.
- `registry` - This module creates a ECR repository.

VPC is created with external module `terraform-aws-modules/vpc/aws`.

## Environments 🛠️
By default, repository contains only `production` environment. You can create new environment by copying the `production`
directory and changing specific variables.

## TODO 📝
- [ ] Add Route53 module
- [ ] Add Lambda module
- [ ] Setup CI/CD pipeline
