resource "oci_core_drg" "drg_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  display_name   = "drg_i2lab"
//  default_export_drg_route_distribution_id = oci_core_drg_route_distribution.drg_route_distribution_i2lab.id
}

resource "oci_core_drg_attachment" "drg_i2lab_attachment" {
  drg_id         = oci_core_drg.drg_i2lab.id
  vcn_id         = oci_core_vcn.vcn_i2lab.id
  display_name   = "drg_i2lab_attachment"
}

#resource "oci_core_route_table" "rt_drg_i2lab" {
#  compartment_id = oci_identity_compartment.i2lab.id
#  vcn_id         = oci_core_vcn.vcn_i2lab.id
#  display_name   = "rt_drg_i2lab"
#    route_rules {
#    destination       = "10.0.0.0/8"
#    network_entity_id = oci_core_drg_attachment.drg_i2lab_attachment.id
#    description       = "Route via DRG to on-premises networks"
#  }
#}

/*
resource "oci_core_drg_route_distribution" "drg_route_distribution_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  drg_id         = oci_core_drg.drg_i2lab.id
  route_table_id = oci_core_route_table.rt_drg_i2lab.id
}

resource "oci_core_drg_route_distribution_statements" "drg_route_distribution_statements_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  drg_route_distribution_id = oci_core_drg_route_distribution.drg_route_distribution_i2lab.id
  route_distribution_statements {
    match_criteria = "MATCH_ALL"
    priority       = 1
    action         = "ACCEPT"
  }
}
*/

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