data "aws_route53_zone" "hosted_zone" {
  zone_id = var.route53_zone_id
}

resource "aws_route53_record" "ec2_instance" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = local.api_domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_instance.instance.public_ip]
}