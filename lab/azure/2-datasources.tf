/*data "azurerm_ssh_public_key" "i2lab" {
  name                = "existing"
  resource_group_name = "existing"
}
*/

data "azurerm_client_config" "i2lab" {}

data "azurerm_platform_image" "debian" {
  location  = var.AZ_LOCATION
  publisher = "Debian"
  offer     = "debian-12"
  sku       = "12"
  //  version   = "latest"
}