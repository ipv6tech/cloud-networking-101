# Configure the Google Cloud provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.9.0" # Use the latest version compatible with your setup
    }
  }
}
provider "google" {
  credentials = file("credentials.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}