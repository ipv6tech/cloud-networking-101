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

# Create a public subnet
resource "azurerm_subnet" "i2lab-public" {
  name                 = "i2lab-public"
  resource_group_name  = azurerm_resource_group.i2lab-rg.name
  virtual_network_name = azurerm_virtual_network.i2lab_vnet.name
  address_prefixes     = [var.PUBLIC_SUBNET_CIDR_BLOCK]
}

# Create a gw-subnet for vng
resource "azurerm_subnet" "gw-subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.i2lab-rg.name
  virtual_network_name = azurerm_virtual_network.i2lab_vnet.name
  address_prefixes     = [var.VNG_SUBNET_CIDR_BLOCK]
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

# Create a public IP address
resource "azurerm_public_ip" "public_ip" {
  name                = "i2lab_public_ip"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name
  allocation_method   = "Static"
}

# Create a public IP address for vng
resource "azurerm_public_ip" "vng_public_ip" {
  name                = "i2lab-vng-public-ip"
  location            = azurerm_resource_group.i2lab-rg.location
  resource_group_name = azurerm_resource_group.i2lab-rg.name
  allocation_method   = "Static"
}

# Create a network interface
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