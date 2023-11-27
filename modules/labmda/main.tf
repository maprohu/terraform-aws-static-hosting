data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "${path.module}/build/lambda.zip"
}

data "aws_iam_policy_document" "lambda" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lambda_secret" {
  statement {
    effect = "Allow"

    actions = [
      "secretsmanager:GetSecretValue"
    ]
    resources = [
      var.var.secret_arn
    ]
  }
}

locals {
  prefix        = var.name
}

resource "aws_iam_role" "lambda" {
  name               = "${local.prefix}_iam_role"
  assume_role_policy = data.aws_iam_policy_document.lambda.json

  inline_policy {
    name = "read_secret"
    policy = data.aws_iam_policy_document.lambda_secret.json
  }
}

data "aws_iam_policy" "lambda_basic_execution" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda.name
  policy_arn = data.aws_iam_policy.lambda_basic_execution.arn
}

resource "aws_lambda_function" "trigger_github_action" {
  filename      = data.archive_file.lambda.output_path
  function_name = local.prefix
  role          = aws_iam_role.lambda.arn
  handler       = var.lambda_handler

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.runtime

  environment {
    variables = var.lambda_env_vars
  }
}

resource "aws_lambda_function_url" "lambda" {
  function_name      = aws_lambda_function.trigger_github_action.function_name
  authorization_type = "NONE"
}