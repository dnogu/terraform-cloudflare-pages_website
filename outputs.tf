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
 * Output for Cloudflare DNS Record Configuration.
 * Only outputted if DNS is managed by Cloudflare.
 */
output "dns_record" {
  description = "The DNS record details if the DNS is managed by Cloudflare."
  value       = var.cloudflare_managed_dns ? cloudflare_record.pages_domain.name : "DNS not managed by Cloudflare"
}

/**
 * Output for Cloudflare Zone Data.
 * Only outputted if DNS is managed by Cloudflare.
 */
output "cloudflare_zone_data" {
  description = "Details of the Cloudflare Zone if the DNS is managed by Cloudflare."
  value       = var.cloudflare_managed_dns ? data.cloudflare_zone.example : "DNS not managed by Cloudflare"
}

/**
 * Output for HTTP Data Source Configuration.
 */
output "http_request" {
  description = "The status code returned from the Cloudflare API POST request."
  value       = data.http.example.status_code
}

