output "http_url" {
  value = "http://${aws_s3_bucket_website_configuration.hosting.website_endpoint}"
}
