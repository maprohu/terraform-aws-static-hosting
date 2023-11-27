module "oidc" {
  #source = "maprohu/static-hosting/aws//modules/github-oidc"
  source       = "../../modules/github-oidc"

  github_owner = var.github_owner
  github_repo  = var.github_repo

  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  ]
}
