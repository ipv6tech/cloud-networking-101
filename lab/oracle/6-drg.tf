# Create DRG
resource "oci_core_drg" "drg_i2lab" {
  compartment_id = oci_identity_compartment.i2lab.id
  display_name   = "drg_i2lab"
}

# Create DRG Attachments to the VCN
resource "oci_core_drg_attachment" "drg_i2lab_attachment" {
  drg_id         = oci_core_drg.drg_i2lab.id
  vcn_id         = oci_core_vcn.vcn_i2lab.id
  display_name   = "drg_i2lab_attachment"
}

/* Disabled for the TechEx 2024 workshop. We will manually create this resource in the Oracle Cloud Console.
# Fast Connect - Virtual Circuit toward Internet2 Layer 3 Ashburn
resource "oci_core_virtual_circuit" "generated_oci_core_virtual_circuit" {
	bandwidth_shape_name = "1 Gbps"
	compartment_id = oci_identity_compartment.i2lab.id
	display_name = "fc-i2lab"
	gateway_id = "ocid1.drg.oc1.iad.aaaaaaaasl7nkl42bxis3pmtg55nrqimvd5r4uvgjtjmuof3vhr6togrsxua"
	ip_mtu = "MTU_1500"
	is_bfd_enabled = "false"
	is_transport_mode = "false"
	provider_service_id = "ocid1.providerservice.oc1.iad.aaaaaaaa2o3hjxotf54yxpkkpzwirciyadm2mc3xxsyaszwoxo6trxvkbrqa"
	type = "PRIVATE"
}
*/