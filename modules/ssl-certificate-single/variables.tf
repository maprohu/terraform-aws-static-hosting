# Must be us-east-1 for Cloudfront
# https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cnames-and-https-requirements.html#https-requirements-certificate-issuer
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "domain_name" {
  type = string
}

variable "host_name" {
  type = string
}

