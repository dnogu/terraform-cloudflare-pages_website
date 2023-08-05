
resource "cloudflare_pages_domain" "pages_domain" {
  account_id   = var.cloudflare_account_id
  project_name = replace(var.custom_domain, ".", "")
  domain       = var.custom_domain
}

resource "cloudflare_pages_project" "source_config" {
  account_id        = var.cloudflare_account_id
  name              = "this-is-my-project-01"
  production_branch = "main"
  source {
    type = "github"
    config {
      repo_name                     = var.repo_name
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "custom"
      preview_branch_includes       = ["dev", "preview"]
      preview_branch_excludes       = ["main", "prod"]
    }
  }
}
