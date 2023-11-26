
variable "bucket_id" {
  type = string
}

variable "aliases" {
  type = list(string)
}

variable "certificate_arn" {
  type = string
}

# https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html
variable "price_class" {
  type    = string
  default = "PriceClass_100"
}
