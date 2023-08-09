variable "cloudflare_account_id" {
  type        = string
  description = "The ID associated with the Cloudflare account."
}

variable "cloudflare_api_token" {
  type        = string
  description = "The API Token Used for api calls."
}

variable "custom_domain" {
  type        = string
  default     = "example.com"
  description = "The domain name intended for the website."
}

variable "repo_type" {
  type        = string
  description = "The type of Version Control System (VCS) in use, either 'github' or 'gitlab'."
}

variable "repo_name" {
  type        = string
  description = "The name of the repository housing the website's source code."
}

variable "pages_production_branch" {
  type        = string
  default     = "main"
  description = "The primary branch used for production in the VCS."
}

variable "pages_pr_comments_enabled" {
  type    = bool
  default = true
  description = "Flag to indicate if Pull Request comments should be enabled."
}

variable "pages_deployments_enabled" {
  type    = bool
  default = true
  description = "Flag to determine if deployments are enabled."
}

variable "pages_preview_deployment_setting" {
  type    = string
  default = "custom"
  description = "Setting to determine how preview deployments are handled."
}

variable "pages_production_deployment_enabled" {
  type    = bool
  default = true
  description = "Flag to indicate if production deployments are enabled."
}

variable "preview_branch_includes" {
  type    = list(string)
  default = ["preview", "dev"]
  description = "List of branch names that should be included for previews."
}

variable "preview_branch_excludes" {
  type        = list(string)
  default     = []
  description = "List of branch names to exclude from previews."
}

variable "pages_root_dir" {
  type        = string
  default     = ""
  description = "The directory in which the build command is executed."
}

variable "pages_destination_dir" {
  type        = string
  default     = ""
  description = "The directory within the repository where the HTML content resides."
}

variable "cloudflare_zone_lookup" {
  type        = string
  description = "The DNS zone managed by Cloudflare that's associated with this configuration."
}

variable "cloudflare_managed_dns" {
  type        = bool
  default     = true
  description = "Boolean to indicate if the DNS Zone is under Cloudflare's management."
}

variable "repo_owner" {
  type        = string
  description = "The individual or organization that owns the specified repository."
}

variable "cloudflare_api_email" {
  type        = string
  description = "Then email address associated witht the Cloudflare API Token."
}