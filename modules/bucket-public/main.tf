resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = var.bucket_id

  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_ownership_controls" "hosting" {
  bucket = var.bucket_id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "hosting" {
  bucket = var.bucket_id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "hosting" {
  depends_on = [
    aws_s3_bucket_ownership_controls.hosting,
    aws_s3_bucket_public_access_block.hosting,
  ]

  bucket = var.bucket_id
  acl    = "private"
}

data "aws_s3_bucket" "hosting" {
  bucket = var.bucket_id
}
data "aws_iam_policy_document" "hosting" {
  statement {
    sid    = "AllowPublicRead"
    effect = "Allow"
    resources = [
      "${data.aws_s3_bucket.hosting.arn}/*",
    ]
    actions = ["S3:GetObject"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}
resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = var.bucket_id
  policy = data.aws_iam_policy_document.hosting.json
}
