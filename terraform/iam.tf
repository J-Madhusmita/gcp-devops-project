resource "google_service_account" "backend_sa" {

  account_id   = var.backend_service_account_name

  display_name = var.backend_service_account_display_name
}

## attach IAM Roles for Backend Service Account

resource "google_project_iam_member" "storage_admin" {

  project = var.project_id

  role = "roles/storage.objectAdmin"

  member = "serviceAccount:${google_service_account.backend_sa.email}"
}

resource "google_project_iam_member" "secret_accessor" {

  project = var.project_id

  role = "roles/secretmanager.secretAccessor"

  member = "serviceAccount:${google_service_account.backend_sa.email}"
}

resource "google_project_iam_member" "pubsub_publisher" {

  project = var.project_id

  role = "roles/pubsub.publisher"

  member = "serviceAccount:${google_service_account.backend_sa.email}"
}

resource "google_project_iam_member" "artifact_registry_reader" {

  project = var.project_id

  role = "roles/artifactregistry.reader"

  member = "serviceAccount:${google_service_account.backend_sa.email}"
}