// These are done separately because they are required for resources in this project
resource "google_project_service" "cloudresourcemanager" {
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "storage" {
  service                    = "storage.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_project_service" "compute" {
  service                    = "compute.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

locals {
  manual_apis = [
    "cloudresourcemanager.googleapis.com",
    "storage.googleapis.com",
    "compute.googleapis.com",
  ]
  remaining_apis = [for s in var.required_apis : s if !contains(local.manual_apis, s)]
}

resource "google_project_service" "enabled_apis" {
  for_each                   = toset(local.remaining_apis)
  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false
}
