output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.static_site_distribution.domain_name
}

output "cloudfront_hosted_zone_id" {
  value = aws_cloudfront_distribution.static_site_distribution.hosted_zone_id
}
