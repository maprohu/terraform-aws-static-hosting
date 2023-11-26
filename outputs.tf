output "content_s3" {
  value = var.bucket_name
}

output "content_url" {
  value = module.bucket_public.http_url
}

output "dist_url" {
  value = "https://${var.host_name}.${var.domain_name}"
}
