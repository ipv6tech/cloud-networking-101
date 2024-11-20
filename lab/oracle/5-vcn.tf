resource "oci_core_vcn" "vcn_i2lab" {
  cidr_block     = var.VCN_CIDR
  display_name   = "i2lab"
  compartment_id = oci_identity_compartment.i2lab.id
  dns_label      = "i2lab"
}

resource "oci_core_subnet" "public" {
  cidr_block                 = var.SUBNET_CIDR
  display_name               = "public"
  compartment_id             = oci_identity_compartment.i2lab.id
  vcn_id                     = oci_core_vcn.vcn_i2lab.id
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_route_table.rt_i2lab.id
  security_list_ids          = [oci_core_security_list.sl_i2lab.id]
}

resource "oci_core_route_table" "rt_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  vcn_id         = oci_core_vcn.vcn_i2lab.id
  display_name   = "rt_i2lab"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw_i2lab.id
    description       = "Default route to the internet gateway"
  }
  route_rules {
    network_entity_id = oci_core_drg.drg_i2lab.id
    destination       = "10.0.0.0/8"
    destination_type  = "CIDR_BLOCK"
    description       = "Route via DRG to on-premises networks"
    route_type        = "STATIC"
  }
}

resource "oci_core_security_list" "sl_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  display_name   = "sl_i2lab"
  vcn_id         = oci_core_vcn.vcn_i2lab.id
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  ingress_security_rules {
    source      = "0.0.0.0/0"
    protocol    = "all"
  }
}
