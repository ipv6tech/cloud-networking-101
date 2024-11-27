terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "6.18.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = var.OCI_TENANCY
  user_ocid = var.OCI_USER
  fingerprint = var.OCI_FINGERPRINT
  private_key_path = var.OCI_PRIVATE_KEY_FILE
  region = var.OCI_REGION
}