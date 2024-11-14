terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "6.15.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.oci_tenancy
  user_ocid = var.oci_user
  fingerprint = var.oci_fingerprint
  private_key_path = var.oci_private_key_file
  region = var.oci_region
}