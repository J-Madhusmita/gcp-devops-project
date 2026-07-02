resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet"
  ip_cidr_range = var.public_subnet_cidr

  region  = var.region
  network = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet"
  ip_cidr_range = var.private_subnet_cidr

  region  = var.region
  network = google_compute_network.vpc.id

  private_ip_google_access = true
}

resource "google_compute_firewall" "allow_ingress" {

  name    = "allow-http-https-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }

  source_ranges = ["0.0.0.0/0"]

  direction = "INGRESS"
}

resource "google_compute_router" "router" {

  name    = var.router_name
  network = google_compute_network.vpc.id
  region  = var.region

}

resource "google_compute_router_nat" "nat" {

  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = var.region

  nat_ip_allocate_option             = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}