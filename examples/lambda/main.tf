module "lambda" {
  #source = "maprohu/static-hosting/aws//modules/lambda"
  source       = "../../modules/lambda"

  name = "terraform-aws-static-hosting-lambda-example"
  source_dir = "${path.module}/source"
  lambda_env_vars = {}
  secret_arns = []
}
