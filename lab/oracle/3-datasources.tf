# home region
data "oci_identity_region_subscriptions" "home_region" {
  tenancy_id = var.OCI_TENANCY
}

# ADs DataSource
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.OCI_TENANCY
}

# Images DataSource
data "oci_core_images" "OSImage" {
  compartment_id           = var.OCI_COMPARTMENT
  operating_system         = var.OPERATING_SYSTEM
  operating_system_version = var.OPERATING_SYSTEM_VERSION
  shape                    = var.VM_SHAPE
}