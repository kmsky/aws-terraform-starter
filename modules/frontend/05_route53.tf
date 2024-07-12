data "aws_route53_zone" "hosted_zone" {
  zone_id = var.route53_zone_id
}

resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = "300"

  alias {
    name                   = aws_cloudfront_distribution.frontend_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.frontend_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}