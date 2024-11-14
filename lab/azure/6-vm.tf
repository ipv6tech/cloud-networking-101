# Create a virtual machine
resource "azurerm_virtual_machine" "i2lab-vm" {
  name                  = "i2lab-vm"
  location              = azurerm_resource_group.i2lab-rg.location
  resource_group_name   = azurerm_resource_group.i2lab-rg.name
  network_interface_ids = [azurerm_network_interface.i2lab-nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "i2lab-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  // use latest debian 12 image
  storage_image_reference {
    publisher = "data.azurerm_platform_image.debian.publisher"
    offer     = "data.azurerm_platform_image.debian.offer"
    sku       = "data.azurerm_platform_image.debian.sku"
    version   = "data.azurerm_platform_image.debian.version"
  }

  os_profile {
    computer_name  = "i2lab-vm"
    admin_username = "admin"
    admin_password = var.AZ_ADMIN_PASSWORD
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/admin/.ssh/authorized_keys"
      key_data = var.PUBLIC_KEY
    }
  }
}

# bootstrapping file
#data "template_file" "userdata" {
#  template = file("userdata.tpl")
#}#