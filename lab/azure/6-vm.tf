resource "azurerm_linux_virtual_machine" "i2lab-vm" {
  name                = "${var.ENV}-azure"
  resource_group_name = azurerm_resource_group.i2lab-rg.name
  location            = azurerm_resource_group.i2lab-rg.location
  size                = "Standard_DS1_v2"
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
}

# bootstrapping file
#data "template_file" "userdata" {
#  template = file("userdata.tpl")
#}#