/**
 * Cloudflare Pages Domain Configuration.
 *
 * This resource links a custom domain to a Cloudflare Pages project.
 * It depends on the Cloudflare Pages project being set up prior to domain association.
 */
resource "cloudflare_pages_domain" "pages_domain" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.source_config.name
  domain       = var.custom_domain

  depends_on = [
    cloudflare_pages_project.source_config
  ]
}

/**
 * Cloudflare Pages Project Configuration.
 *
 * This resource provides the blueprint for setting up a Cloudflare Pages project.
 * It includes repository, branch, and build configuration details.
 */
resource "cloudflare_pages_project" "source_config" {
  account_id        = var.cloudflare_account_id
  name              = replace(var.custom_domain, ".", "")
  production_branch = "main"

  source {
    type = var.repo_type
    config {
      repo_name                     = var.repo_name
      owner                         = var.repo_owner
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
    root_dir        = var.pages_root_dir
    destination_dir = var.pages_destination_dir
  }
}

/**
 * Cloudflare DNS Record Configuration.
 *
 * If managed by Cloudflare, this resource will create a CNAME record for the custom domain.
 */
resource "cloudflare_record" "pages_domain" {
  count   = var.cloudflare_managed_dns ? 1 : 0
  zone_id = data.cloudflare_zone.example[count.index].id
  name    = trimsuffix(var.custom_domain, join("", [".", var.cloudflare_zone_lookup]))
  value   = "${replace(var.custom_domain, ".", "")}.pages.dev"
  type    = "CNAME"
  ttl     = 3600
}

/**
 * Cloudflare Zone Data Fetcher.
 *
 * If the DNS is managed by Cloudflare, this will fetch the Cloudflare zone details.
 */
data "cloudflare_zone" "example" {
  count      = var.cloudflare_managed_dns ? 1 : 0
  account_id = var.cloudflare_account_id
  name       = var.cloudflare_zone_lookup
}

/**
 * HTTP Data Source Configuration.
 *
 * This is responsible for making a POST request to Cloudflare's API for deployment details.
 */
data "http" "example" {
  url    = "https://api.cloudflare.com/client/v4/accounts/${var.cloudflare_account_id}/pages/projects/${cloudflare_pages_project.source_config.name}/deployments"
  method = "POST"
  request_headers = {
    "X-Auth-Email" = var.cloudflare_api_email
    "X-Auth-Key"   = var.cloudflare_global_api_key
    "Content-Type" = "multipart/form-data"
  }
}