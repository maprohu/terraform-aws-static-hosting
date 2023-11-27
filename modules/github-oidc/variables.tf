variable "github_owner" {
  type = string
}

variable "github_repo" {
  type = string
}

variable "policy_arns" {
  type    = list(string)
  default = []
}
