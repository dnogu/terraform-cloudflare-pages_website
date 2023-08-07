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


variable "preview_branch_excludes" {
  type    = list(string)
  default = []
}

variable "pages_root_dir" {
  type        = string
  default     = ""
  description = "Directory in Repo that contains html file."
}

variable "cloudflare_zone_lookup" {
  type        = string
  description = "Cloudflare Managed Zone"
}

variable "cloudflare_managed_dns" {
  type        = bool
  default     = true
  description = "Is this DNS Zone managed by Cloudflare."
}