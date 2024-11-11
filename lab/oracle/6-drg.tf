resource "oci_core_drg" "drg_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  display_name   = "drg_i2lab"
}

resource "oci_core_drg_attachment" "drg_i2lab_attachment" {
  drg_id         = oci_core_drg.drg_i2lab.id
  vcn_id         = oci_core_vcn.vcn_i2lab.id
  display_name   = "drg_i2lab_attachment"
}

/*resource "oci_core_virtual_circuit" "i2lab_virtual_circuit" {
  compartment_id            = oci_identity_compartment.i2lab.id
  display_name              = "i2lab_vc"
  bandwidth_shape_name      = "1 Gbps"
  type                      = "PRIVATE"
  customer_asn          = "55038"
  provider_service_key_name = "var.provider_service_key_name"
  ip_address_prefix         = "10.216.0.0/30"
  cross_connect_mappings {
    customer_bgp_peering_ip = "10.216.0.1/30"
    oracle_bgp_peering_ip   = "10.216.0.2/30"
  }
}*/