resource "oci_core_vcn" "vcn_i2lab" {
  cidr_block     = var.vcn_cidr
  display_name   = "i2lab"
  compartment_id = oci_identity_compartment.i2lab.id
  dns_label      = "i2lab"
}

resource "oci_core_subnet" "public" {
  cidr_block                 = var.subnet_cidr
  display_name               = "public"
  compartment_id             = oci_identity_compartment.i2lab.id
  vcn_id                     = oci_core_vcn.vcn_i2lab.id
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_route_table.rt_i2lab.id
//  security_list_ids          = [oci_core_security_list.sl_i2lab.id]
//  dhcp_options_id            = oci_core_vcn.vcn_i2lab.default_dhcp_options_id
}

resource "oci_core_route_table" "rt_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  vcn_id         = oci_core_vcn.vcn_i2lab.id
  display_name   = "rt_i2lab"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw_i2lab.id
  }
}
