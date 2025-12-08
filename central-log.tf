resource "google_storage_bucket" "centralized_logs" {
  name                        = "${local.resource_name}-centralized-logs"
  project                     = local.project_id
  location                    = local.region
  uniform_bucket_level_access = true
  labels                      = local.labels

  lifecycle_rule {
    condition {
      age = var.log_retention_days
    }
    action {
      type = "Delete"
    }
  }

  depends_on = [google_project_service.storage]
}

resource "google_logging_project_sink" "this" {
  name        = "${local.resource_name}-centralized"
  project     = local.project_id
  destination = "storage.googleapis.com/${google_storage_bucket.centralized_logs.name}"
  description = "Centralized Logging"
  disabled    = false

  # Empty filter = export all logs. Narrow if you want.
  filter = ""

  depends_on = [google_project_service.cloudresourcemanager]
}

# Allow the sink's writer identity to write into the bucket
resource "google_storage_bucket_iam_member" "logs_writer" {
  bucket = google_storage_bucket.centralized_logs.name
  role   = "roles/storage.objectCreator"
  member = google_logging_project_sink.this.writer_identity
}
