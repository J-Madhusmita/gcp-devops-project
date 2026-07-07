resource "google_container_cluster" "gke_cluster" {

  name     = "employee-gke-cluster"
  location = var.region

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.private_subnet.id

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {

  name     = "primary-node-pool"
  location = var.region
  cluster  = google_container_cluster.gke_cluster.name

  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  node_config {

    machine_type = "e2-medium"

    service_account = google_service_account.backend_sa.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}