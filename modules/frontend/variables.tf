variable "project_name" {
    description = "The name of the project"
    type        = string
}

# ACM
# ---------------------------------------------------------------------------
variable "domain_name" {
    description = "The domain name for the ACM certificate"
    type        = string
}


# Route53
# ---------------------------------------------------------------------------
variable "route53_zone_id" {
    description = "The Route53 zone ID"
    type        = string
}