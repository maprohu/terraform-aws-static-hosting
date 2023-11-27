variable "name" {
  type = string
}
variable "source_dir" {
  type = string
}
variable "secret_arn" {
  type = string
}
variable "lambda_handler" {
  type = string
  default = "index.lambda"
}
variable "runtime" {
  type = string
  default = "nodejs18.x"
}
variable "lambda_env_vars" {
  type = map(string)
}