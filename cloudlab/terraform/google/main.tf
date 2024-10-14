# Configure the Google Cloud provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" # Use the latest version compatible with your setup
    }
  }
}

# Variables (Customize these as needed)
variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east1"
}

# VPC Network
resource "google_compute_network" "main" {
  project                 = var.project_id
  name                    = "i2cc-demo-vpc"
  auto_create_subnetworks = false # Important: Disable automatic subnet creation
}

# Public Subnet
resource "google_compute_subnetwork" "public" {
  project       = var.project_id
  name          = "public-subnet"
  ip_cidr_range = "10.208.1.0/24"
  region        = var.region
  network       = google_compute_network.main.id

  # Enable Private Google Access for instances in this subnet
  private_ip_google_access = true
}

# Private Subnet
resource "google_compute_subnetwork" "private" {
  project       = var.project_id
  name          = "private-subnet"
  ip_cidr_range = "10.208.2.0/24"
  region        = var.region
  network       = google_compute_network.main.id
}

# Internet Gateway
resource "google_compute_internet_gateway" "default" {
  project = var.project_id
  name    = "igw-1"
}

# Attach the Internet Gateway to the VPC Network
resource "google_compute_network_gateway_association" "default" {
  project          = var.project_id
  name             = "my-internet-gateway-association"
  network          = google_compute_network.main.id
  internet_gateway = google_compute_internet_gateway.default.id
}

# Cloud Router for NAT
resource "google_compute_router" "default" {
  project = var.project_id
  name    = "cloud-rtr-1"
  region  = var.region
  network = google_compute_network.main.id

  bgp {
    asn = 64514 # Use your own ASN if you have one
  }
}

# Cloud NAT Configuration
resource "google_compute_router_nat" "default" {
  project = var.project_id
  router  = google_compute_router.default.name
  name    = "nat-gw"
  region  = var.region

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_SPECIFIED"
  subnetwork {
    name                    = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

# Firewall rule to allow SSH to the VM in the private subnet
resource "google_compute_firewall" "allow_ssh_from_internet" {
  project = var.project_id
  name    = "allow-ssh-from-internet"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}

# Small VM Instance in the Private Subnet
resource "google_compute_instance" "small_vm" {
  project      = var.project_id
  name         = "test-vm"
  zone         = "${var.region}-a"
  machine_type = "f1-micro"
  network_interface {
    subnetwork = google_compute_subnetwork.private.id
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  tags = ["allow-ssh"] # Add the tag to allow SSH traffic
}
