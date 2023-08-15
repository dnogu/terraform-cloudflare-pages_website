/**
 * Output for Cloudflare Pages Domain Configuration.
 */
output "pages_domain" {
  description = "The configuration details of the Cloudflare Pages domain."
  value       = cloudflare_pages_domain.pages_domain
}

/**
 * Output for Cloudflare Pages Project Configuration.
 */
output "pages_project" {
  description = "The configuration details of the Cloudflare Pages project."
  value       = cloudflare_pages_project.source_config
}

/**
 * Output for HTTP Data Source Configuration.
 */
output "http_request" {
  description = "The status code returned from the Cloudflare API POST request."
  value       = data.http.example
}

