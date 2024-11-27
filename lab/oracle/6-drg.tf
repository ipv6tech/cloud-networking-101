# Create DRG
resource "oci_core_drg" "drg_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  display_name   = "drg_i2lab"
}

# Create DRG Attachments to the VCN
resource "oci_core_drg_attachment" "drg_i2lab_attachment" {
	drg_id         = oci_core_drg.drg_i2lab.id
	display_name   = "drg_i2lab_attachment"
	drg_route_table_id = oci_core_drg_route_table.i2lab_drg_route_table.id
	network_details {
		id = oci_core_vcn.vcn_i2lab.id
		type = "VCN"
		vcn_route_type = "VCN_CIDRS"
	}
}

# Create DRG Route Table
resource "oci_core_drg_route_table" "i2lab_drg_route_table" {
    drg_id = oci_core_drg.drg_i2lab.id
    display_name = "i2lab DRG Route Table"
	import_drg_route_distribution_id = oci_core_drg_route_distribution.i2lab_drg_route_dist.id
}

# Create route distribution for import
resource "oci_core_drg_route_distribution" "i2lab_drg_route_dist" {
	drg_id = oci_core_drg.drg_i2lab.id
	display_name = "i2lab_drg_route_dist"
	distribution_type = "IMPORT"
}

# Create route distribution statement
resource "oci_core_drg_route_distribution_statement" "i2lab_drg_route_distribution_statement" {
	drg_route_distribution_id = oci_core_drg_route_distribution.i2lab_drg_route_dist.id
	action = "ACCEPT"
	match_criteria {
		match_type = "MATCH_ALL"
	}
	priority = 1
}

/* Disabled for the TechEx 2024 workshop. We will manually create this resource in the Oracle Cloud Console.
# Fast Connect - Virtual Circuit toward Internet2 Layer 3 Ashburn */

/*resource "oci_core_virtual_circuit" "generated_oci_core_virtual_circuit" {
	bandwidth_shape_name = "1 Gbps"
	compartment_id = oci_identity_compartment.i2lab.id
	display_name = "i2cc-i2lab"
	gateway_id = oci_core_drg.drg_i2lab.id
	ip_mtu = "MTU_1500"
	is_bfd_enabled = "true"
	is_transport_mode = "false"
	provider_service_id = "ocid1.providerservice.oc1.iad.aaaaaaaa2o3hjxotf54yxpkkpzwirciyadm2mc3xxsyaszwoxo6trxvkbrqa" //Internet2 Layer 3 Ashburn
	type = "PRIVATE"
	att
}*/