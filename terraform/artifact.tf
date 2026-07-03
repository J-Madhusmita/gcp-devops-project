resource "google_artifact_registry_repository" "docker_repo" {

  location      = var.artifact_location
  repository_id = var.artifact_repository_name

  description = "Docker repository for project"

  format = "DOCKER"

}