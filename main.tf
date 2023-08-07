
resource "cloudflare_pages_domain" "pages_domain" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.source_config.name
  domain       = var.custom_domain
}

resource "cloudflare_pages_project" "source_config" {
  account_id        = var.cloudflare_account_id
  name              = replace(var.custom_domain, ".", "")
  production_branch = "main"
  source {
    type = var.repo_type
    config {
      repo_name                     = var.repo_name
      production_branch             = var.pages_production_branch
      pr_comments_enabled           = var.pages_pr_comments_enabled
      deployments_enabled           = var.pages_deployments_enabled
      production_deployment_enabled = var.pages_deployments_enabled
      preview_deployment_setting    = var.pages_preview_deployment_setting
      preview_branch_includes       = var.preview_branch_includes
      preview_branch_excludes       = distinct(concat(tolist([var.pages_production_branch]), var.preview_branch_excludes))
    }
  }
  build_config {
    root_dir = var.pages_root_dir
  }
}

resource "cloudflare_record" "pages_domain" {
  count   = var.cloudflare_managed_dns ? 1 : 0
  zone_id = data.cloudflare_zone.example[count.index].id
  name    = trimsuffix(var.custom_domain, join("", [".", var.cloudflare_zone_lookup]))
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 3600
}

data "cloudflare_zone" "example" {
  count = var.cloudflare_managed_dns ? 1 : 0
  account_id = var.cloudflare_account_id
  name  = var.cloudflare_zone_lookup
}
