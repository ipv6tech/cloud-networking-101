resource "oci_core_internet_gateway" "igw_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  vcn_id         = oci_core_vcn.vcn_i2lab.id
  display_name   = "i2lab_internet_gateway"
}