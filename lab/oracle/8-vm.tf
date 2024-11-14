resource "oci_core_instance" "i2lab" {
  compartment_id      = var.oci_compartment
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0].name
  shape               = var.vm_shape
  display_name        = "i2lab-oci"

  create_vnic_details {
    subnet_id        = oci_core_subnet.public.id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = file(var.public_key)
  }

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.iad.aaaaaaaac3eshnn5mcmwpwnvy76lnb5wzzlr2dew4ilbb5gfealimrostriq"
  }

  /*provisioner "local-exec" {
    command = templatefile("files/linux-ssh-config.tpl", {
      host         = "${var.env}-oracle"
      hostname     = self.public_ip
      user         = "opc"
      identityfile = var.private_key
    })
  }*/
}