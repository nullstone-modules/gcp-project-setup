# -------------------------------------------------------------------
# Developers: Configure access to a group of developers
# -------------------------------------------------------------------

resource "google_project_iam_binding" "developers_logging_viewer" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/logging.viewer"
  members = ["group:${var.developers_group}"]
}

resource "google_project_iam_binding" "developers_monitoring_viewer" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/monitoring.viewer"
  members = ["group:${var.developers_group}"]
}

resource "google_project_iam_binding" "developers_run_developer" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/run.developer"
  members = ["group:${var.developers_group}", ]
}

resource "google_project_iam_binding" "developers_storage_object_admin" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/storage.objectAdmin"
  members = ["group:${var.developers_group}", ]
}
