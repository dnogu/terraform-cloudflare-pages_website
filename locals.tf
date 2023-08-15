locals {
  compatibility_date = var.pages_compatibility_date != null ? var.pages_compatibility_date : formatdate("YYYY'-'MM'-'DD", timestamp())
}
