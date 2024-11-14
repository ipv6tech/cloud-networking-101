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
#  credentials = file("~/.config/gcloud/application_default_credentials.json")
  project     = var.gc_project_id
  region      = var.gc_region
  zone        = var.gc_zone
}