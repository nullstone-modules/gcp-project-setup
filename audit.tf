# -------------------------------------------------------------------
# Audit Logging: enable Admin + Data Access logs for all services
#   This is key for SOC 2 evidence: who did what, when, where.
# -------------------------------------------------------------------

resource "google_project_iam_audit_config" "all_services" {
  project = local.project_id
  service = "allServices"

  audit_log_config {
    log_type = "ADMIN_READ"
  }

  audit_log_config {
    log_type = "DATA_READ"
  }

  audit_log_config {
    log_type = "DATA_WRITE"
  }
}
