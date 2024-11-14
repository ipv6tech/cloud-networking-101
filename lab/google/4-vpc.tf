# VPC Network
resource "google_compute_network" "main" {
  project                 = var.GC_PROJECT_ID
  name                    = "${var.ENV}-vpc"
  auto_create_subnetworks = false # Important: Disable automatic subnet creation
}

# Public Subnet
resource "google_compute_subnetwork" "public" {
  project       = var.GC_PROJECT_ID
  name          = "public-sn"
  ip_cidr_range = var.SUBNET_IP_CIDR_RANGE
  region        = var.GC_REGION
  network       = google_compute_network.main.id
}
