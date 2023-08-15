// ------------------------
// Cloudflare Configuration
// ------------------------

variable "cloudflare_account_id" {
  description = "The ID associated with the Cloudflare account."
  type        = string
}

variable "cloudflare_api_email" {
  description = "The email address associated with the Cloudflare API Token."
  type        = string
}

variable "cloudflare_api_token" {
  description = "The API Token used for Cloudflare API calls."
  type        = string
}

variable "cloudflare_global_api_key" {
  description = "Global API key for Cloudflare."
  type        = string
}

variable "cloudflare_zone_lookup" {
  description = "The DNS zone managed by Cloudflare that's associated with this configuration."
  type        = string
}

variable "cloudflare_managed_dns" {
  description = "Boolean to indicate if the DNS Zone is under Cloudflare's management."
  type        = bool
  default     = true
}

variable "pages_compatibility_date" {
  description = "Compatibility date used for Pages Functions."
  type        = string
}

// --------------------------
// Repository Configuration
// --------------------------

variable "repo_type" {
  description = "The type of Version Control System (VCS) in use, either 'github' or 'gitlab'."
  type        = string
}

variable "repo_name" {
  description = "The name of the repository housing the website's source code."
  type        = string
}

variable "repo_owner" {
  description = "The individual or organization that owns the specified repository."
  type        = string
}

// --------------------------
// Pages Deployment Settings
// --------------------------

variable "pages_production_branch" {
  description = "The primary branch used for production in the VCS."
  type        = string
  default     = "main"
}

variable "pages_pr_comments_enabled" {
  description = "Flag to indicate if Pull Request comments should be enabled."
  type        = bool
  default     = true
}

variable "pages_deployments_enabled" {
  description = "Flag to determine if deployments are enabled."
  type        = bool
  default     = true
}

variable "pages_production_deployment_enabled" {
  description = "Flag to indicate if production deployments are enabled."
  type        = bool
  default     = true
}

variable "pages_preview_deployment_setting" {
  description = "Setting to determine how preview deployments are handled."
  type        = string
  default     = "custom"
}

variable "preview_branch_includes" {
  description = "List of branch names that should be included for previews."
  type        = list(string)
  default     = ["preview", "dev"]
}

variable "preview_branch_excludes" {
  description = "List of branch names to exclude from previews."
  type        = list(string)
  default     = []
}

// --------------------------
// Build Configuration
// --------------------------

variable "pages_root_dir" {
  description = "The directory in which the build command is executed."
  type        = string
  default     = ""
}

variable "pages_destination_dir" {
  description = "The directory within the repository where the HTML content resides."
  type        = string
  default     = ""
}

// --------------------------
// Domain Configuration
// --------------------------

variable "custom_domain" {
  description = "The domain name intended for the website."
  type        = string
  default     = "example.com"
}
