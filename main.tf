// This resource configures a custom domain for a Cloudflare Pages project.
resource "cloudflare_pages_domain" "pages_domain" {
  // ID of the Cloudflare account
  account_id   = var.cloudflare_account_id
  // The project name is derived from the Cloudflare Pages project's source configuration
  project_name = cloudflare_pages_project.source_config.name
  // Custom domain to be associated with the Cloudflare Pages project
  domain       = var.custom_domain
  // Ensure the Cloudflare Pages project is created before associating the domain
  depends_on = [
    cloudflare_pages_project.source_config
  ]
}

// This resource sets up a Cloudflare Pages project.
resource "cloudflare_pages_project" "source_config" {
  account_id        = var.cloudflare_account_id
  name              = replace(var.custom_domain, ".", "")
  production_branch = "main"
  // Configuration for the version control system (VCS) source
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
      // Exclude production branch and any other specified branches from previews
      preview_branch_excludes       = distinct(concat(tolist([var.pages_production_branch]), var.preview_branch_excludes))
    }
  }

  // Build and deployment configuration settings
  build_config {
    root_dir        = var.pages_root_dir
    destination_dir = var.pages_destination_dir
  }
}

// This resource creates a DNS record for the custom domain in Cloudflare, if managed by Cloudflare.
resource "cloudflare_record" "pages_domain" {
  count   = var.cloudflare_managed_dns ? 1 : 0
  zone_id = data.cloudflare_zone.example[count.index].id
  // Extract the subdomain from the custom domain name
  name    = trimsuffix(var.custom_domain, join("", [".", var.cloudflare_zone_lookup]))
  // Use the modified domain name as the CNAME value
  value   = "${replace(var.custom_domain, ".", "")}.pages.dev"
  type    = "CNAME"
  ttl     = 3600
}

// Fetch the Cloudflare zone details, if managed by Cloudflare.
data "cloudflare_zone" "example" {
  count      = var.cloudflare_managed_dns ? 1 : 0
  account_id = var.cloudflare_account_id
  name       = var.cloudflare_zone_lookup
}

data "http" "example" {
  url = "https://api.cloudflare.com/client/v4/accounts/${var.cloudflare_account_id}/pages/projects/${cloudflare_pages_project.source_config.name}/deployments"
  method = "POST"

  # Optional request headers
  request_headers = {
    Accept = "multipart/form-data"
    X-Auth-Email = var.cloudflare_api_email
  }
}

output "response_header" {
  value   = data.http.example.status_code
}