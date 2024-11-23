resource "oci_core_instance" "i2lab" {
  compartment_id      = var.OCI_COMPARTMENT
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0].name
  shape               = var.VM_SHAPE
  display_name        = "i2lab-oci"

  create_vnic_details {
    subnet_id        = oci_core_subnet.public.id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = file(var.PUBLIC_KEY)
  }

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.iad.aaaaaaaac3eshnn5mcmwpwnvy76lnb5wzzlr2dew4ilbb5gfealimrostriq"
  }

  # Local provisioner to create SSH config
  provisioner "local-exec" {
    command = <<-EOT
      # Wait for public IP to be allocated
      while [[ -z "$PUBLIC_IP" ]]; do
        PUBLIC_IP=$(oci compute instance list-vnics \
          --instance-id ${self.id} \
          --query "data[0].\"public-ip\"" \
          --raw-output)
        sleep 5
      done

      # Create or update SSH config
      cat <<EOF >> ~/.ssh/config

      Host ${self.display_name}
        HostName $PUBLIC_IP
        User opc
        IdentityFile ~/.ssh/id_rsa
        StrictHostKeyChecking no
        UserKnownHostsFile /dev/null
EOF
    EOT

    interpreter = ["/bin/bash", "-c"]
  }
}