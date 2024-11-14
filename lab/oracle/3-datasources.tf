# home region
data "oci_identity_region_subscriptions" "home_region" {
tenancy_id = var.oci_tenancy
}

# ADs DataSource
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.oci_tenancy
}

# Images DataSource
data "oci_core_images" "OSImage" {
  compartment_id           = var.oci_compartment
  operating_system         = var.operating_system
  operating_system_version = var.operating_system_version
  shape                    = var.vm_shape
}