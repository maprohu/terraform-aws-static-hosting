output "content_s3" {
  value = var.bucket_name
}

output "dist_url" {
  value = "https://${var.host_name}.${var.domain_name}"
}
