# Configure the Google Cloud provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 7.9.0"
    }
  }
}
provider "google" {
#  credentials = file("~/.config/gcloud/application_default_credentials.json")
  project     = var.GC_PROJECT_ID
  region      = var.GC_REGION
  zone        = var.GC_ZONE
}