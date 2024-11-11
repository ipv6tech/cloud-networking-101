# VPC Network
resource "google_compute_network" "main" {
  project                 = var.project_id
  name                    = "${var.env}-vpc"
  auto_create_subnetworks = false # Important: Disable automatic subnet creation
}

# Public Subnet
resource "google_compute_subnetwork" "public" {
  project       = var.project_id
  name          = "public-sn"
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.region
  network       = google_compute_network.main.id
}
