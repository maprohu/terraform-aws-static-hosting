locals {
  bucket_name = "tf-static-hosting-complete-example"
}

module "static_hosting" {
  #source = "maprohu/static-hosting/aws"
  source = "../.."

  bucket_name = local.bucket_name
  domain_name = var.domain_name
  host_name  = local.bucket_name
}
