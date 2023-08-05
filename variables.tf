variable "cloudflare_account_id" {
  type        = string
  description = "Required: Cloudflare Account ID"
}

variable "custom_domain" {
  type        = string
  default     = "example.com"
  description = "Custom Domain Name for website"
}

variable "repo_type" {
  type        = string
  description = "Required: VCS type. github or gitlab."
}

variable "repo_name" {
  type        = string
  description = "Required: Repo that contains webpage source code."
}

variable "pages_production_branch" {
  type        = string
  default     = "main"
  description = "Production Branch in VCS"
}

variable "pages_pr_comments_enabled" {
  type    = bool
  default = true
}

variable "pages_deployments_enabled" {
  type    = bool
  default = true
}

variable "pages_preview_deployment_setting" {
  type    = string
  default = "custom"
}

variable "pages_production_deployment_enabled" {
  type    = bool
  default = true
}

variable "preview_branch_includes" {
  type    = list(string)
  default = ["preview", "dev"]
}