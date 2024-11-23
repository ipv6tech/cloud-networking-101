# Create a resource group
resource "azurerm_resource_group" "i2lab-rg" {
  name     = "i2lab-rg"
  location = var.AZ_LOCATION
}

# Create a virtual network
resource "azurerm_virtual_network" "i2lab_vnet" {
  name          = "i2lab-vnet"
  address_space = ["10.200.0.0/16"]
  location            = var.AZ_LOCATION
  resource_group_name = azurerm_resource_group.i2lab-rg.name
}

# Create a route table for the vnet subnets
resource "azurerm_route_table" "i2lab-rt" {
  name                = "i2lab-rt"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name
}

# Create a public subnet
resource "azurerm_subnet" "i2lab-public" {
  name                 = "i2lab-public"
  resource_group_name  = azurerm_resource_group.i2lab-rg.name
  virtual_network_name = azurerm_virtual_network.i2lab_vnet.name
  address_prefixes     = [var.PUBLIC_SUBNET_CIDR_BLOCK]
}

# Associate the route table with public subnet
resource "azurerm_subnet_route_table_association" "i2lab-rt-assoc-public" {
  subnet_id      = azurerm_subnet.i2lab-public.id
  route_table_id = azurerm_route_table.i2lab-rt.id
}

# Create a gw-subnet for vng
resource "azurerm_subnet" "gw-subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.i2lab-rg.name
  virtual_network_name = azurerm_virtual_network.i2lab_vnet.name
  address_prefixes     = [var.VNG_SUBNET_CIDR_BLOCK]
}

# Associate the route table with gw-subnet
resource "azurerm_subnet_route_table_association" "i2lab-rt-assoc-gw-subnet" {
  subnet_id      = azurerm_subnet.gw-subnet.id
  route_table_id = azurerm_route_table.i2lab-rt.id
}

# Create a network security group
resource "azurerm_network_security_group" "i2lab-nsg" {
  name                = "i2lab-nsg"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name

  security_rule {
    name                       = "Allow-ICMP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the subnet
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.i2lab-public.id
  network_security_group_id = azurerm_network_security_group.i2lab-nsg.id
}