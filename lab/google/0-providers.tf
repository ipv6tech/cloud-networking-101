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
  project     = var.GC_PROJECT_ID
  region      = var.GC_REGION
  zone        = var.GC_ZONE
}