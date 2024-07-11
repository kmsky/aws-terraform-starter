module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name               = var.domain_name
  create_route53_records    = true
  zone_id                   = var.route53_zone_id

  validation_method         = "DNS"

  subject_alternative_names = ["*.${var.domain_name}"]

  wait_for_validation       = true

  tags = {
    Name = "${var.project_name}-acm"
  }
}