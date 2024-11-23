resource "azurerm_linux_virtual_machine" "i2lab-vm" {
  name                = "${var.ENV}-azure"
  resource_group_name = azurerm_resource_group.i2lab-rg.name
  location            = azurerm_resource_group.i2lab-rg.location
  size                = "Standard_DS1"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.i2lab-nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.PUBLIC_KEY)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-12"
    sku       = "12-gen2"
    version   = "latest"
  }
  # Local provisioner to create SSH config
  provisioner "local-exec" {
    command = <<-EOT
      # Wait for public IP to be allocated
      while [[ -z "$PUBLIC_IP" ]]; do
        PUBLIC_IP=$(az network public-ip show \
          --resource-group ${azurerm_resource_group.i2lab-rg.name} \
          --name ${azurerm_public_ip.public_ip.name} \
          --query ipAddress -o tsv)
        sleep 5
      done

      # Create or update SSH config
      cat <<EOF >> ~/.ssh/config

      Host ${self.name}
        HostName $PUBLIC_IP
        User ${self.admin_username}
        IdentityFile ~/.ssh/id_rsa
        StrictHostKeyChecking no
        UserKnownHostsFile /dev/null
EOF
    EOT

    interpreter = ["/bin/bash", "-c"]
  }
}

# Create a public IP address for the VM
resource "azurerm_public_ip" "public_ip" {
  name                = "i2lab_public_ip"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name
  allocation_method   = "Static"
}

# Create a network interface for the VM
resource "azurerm_network_interface" "i2lab-nic" {
  name                = "i2lab-nic"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.i2lab-public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}