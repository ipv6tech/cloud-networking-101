# Create a virtual network gateway
resource "azurerm_virtual_network_gateway" "i2lab-vng" {
  name                = "i2lab-vng"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name

  type     = "ExpressRoute"
  vpn_type = "RouteBased"
  sku      = "Standard"

  ip_configuration {
    name                          = "i2lab-vng-ipconfig"
    public_ip_address_id          = azurerm_public_ip.vng_public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gw-subnet.id
  }
}

# Create a public IP address for vng
resource "azurerm_public_ip" "vng_public_ip" {
  name                = "i2lab-vng-public-ip"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name
  allocation_method   = "Static"
}
