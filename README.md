# Terraform Cloudflare Pages Module
=================

This Terraform module facilitates the deployment and management of Cloudflare Pages projects, domains, and associated DNS settings.

## Table of Contents
-----------------

- Features
- Usage
- Input Variables
- Outputs
- Requirements
- License

## Features
--------

- Set up and manage a "Cloudflare Pages" project.
- Configure a custom domain with a "Cloudflare Pages" project.
- Control DNS records for the custom domain.
- Retrieve "Cloudflare" zone data.

## Usage
-----

Embed this module in your Terraform scripts:

```
module "cloudflare_pages" {
  source                        = "path-to-this-module"
  cloudflare_account_id         = "your-account-id"
  cloudflare_api_email          = "your-api-email"
  cloudflare_api_token          = "your-api-token"
  cloudflare_global_api_key     = "your-global-api-key"
  repo_type                     = "github"
  repo_name                     = "your-repo-name"
  repo_owner                    = "your-repo-owner"
  pages_production_branch       = "main"
  custom_domain                 = "example.com"
  // ... additional variables
}
```

> **Note**: Modify "path-to-this-module" with the actual path or URL to this module.

## Input Variables
---------------

Consult the [variables.tf](./variables.tf) file for a comprehensive list and description of all the input variables.

## Outputs
-------

- **pages_domain**: Details of the "Cloudflare Pages" domain.
- **pages_project**: Details of the "Cloudflare Pages" project.
- **dns_record**: DNS record details if DNS is managed by "Cloudflare".
- **cloudflare_zone_data**: Details of the "Cloudflare Zone" if DNS is managed by "Cloudflare".
- **http_request_status_code**: Status code from the "Cloudflare" API POST request.
- **http_request_response_body**: Response body from the "Cloudflare" API POST request.
- **http_request_response_headers**: Response headers from the "Cloudflare" API POST request.

For a more detailed understanding, inspect the [outputs.tf](./outputs.tf) file.

## Requirements
------------

- "Terraform" v0.14+ (or the version you're currently using)
- An active "Cloudflare" account with the appropriate API tokens and keys.
