variable "name" {
  type = string
}
variable "source_dir" {
  type = string
}
variable "secret_arns" {
  type = list(string)
}
variable "lambda_handler" {
  type = string
  default = "index.handler"
}
variable "runtime" {
  type = string
  default = "nodejs18.x"
}
variable "lambda_env_vars" {
  type = map(string)
}