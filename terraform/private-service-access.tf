## Reserve an internal IP range
resource "google_compute_global_address" "private_service_access" {

  name          = var.private_service_range_name

  purpose       = "VPC_PEERING"

  address_type  = "INTERNAL"

  prefix_length = var.private_service_prefix_length

  network        = google_compute_network.vpc.id
}

## Create the private connection

resource "google_service_networking_connection" "private_vpc_connection" {

  network = google_compute_network.vpc.id

  service = "servicenetworking.googleapis.com"

  reserved_peering_ranges = [
    google_compute_global_address.private_service_access.name
  ]
}