# -------------------------------------------------------------------
# Developers: Configure access to a group of developers
# -------------------------------------------------------------------

resource "google_project_iam_member" "developers_logging_viewer" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/logging.viewer"
  member = "group:${var.developers_group}"
}

resource "google_project_iam_member" "developers_monitoring_viewer" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/monitoring.viewer"
  member = "group:${var.developers_group}"
}

resource "google_project_iam_member" "developers_run_developer" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/run.developer"
  member = "group:${var.developers_group}"
}

resource "google_project_iam_member" "developers_k8s_developer" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/container.developer"
  member = "group:${var.developers_group}"
}

resource "google_project_iam_member" "developers_storage_object_admin" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/storage.objectAdmin"
  member = "group:${var.developers_group}"
}

resource "google_project_iam_member" "developers_storage_admin" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/storage.admin"
  member = "group:${var.developers_group}"
}

resource "google_project_iam_member" "developers_pubsub_admin" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/pubsub.admin"
  member = "group:${var.developers_group}"
}

resource "google_project_iam_member" "developers_workflows_admin" {
  count = var.developers_group != "" ? 1 : 0

  project = local.project_id
  role    = "roles/workflows.admin"
  member = "group:${var.developers_group}"
}
