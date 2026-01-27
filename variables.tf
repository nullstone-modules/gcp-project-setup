variable "developers_group" {
  type        = string
  default     = ""
  description = <<EOF
Set this to enable logging/monitoring access for developers.
This is a Google Workspace group email (e.g. developers@company.com).
Leave empty to avoid granting developer access.
EOF
}

variable "log_retention_days" {
  type        = number
  default     = 365
  description = "Number of days to retain logs in the central log bucket."
}

variable "required_apis" {
  type = list(string)
  default = [
    "bigquery.googleapis.com",
    "cloudasset.googleapis.com",
    "containeranalysis.googleapis.com",
    "essentialcontacts.googleapis.com",
    "firestore.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "sqladmin.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "storage-api.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com",
  ]
}
