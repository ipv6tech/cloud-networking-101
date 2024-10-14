
# Create a resource group
resource "azurerm_resource_group" "i2-lab-rg" {
  name     = "i2-lab-rg"
  location = "East US"
}

# Create a virtual network
resource "azurerm_virtual_network" "i2-lab-vnet" {
  name                = "i2-lab-vnet"
  address_space       = ["10.200.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create a public subnet
resource "azurerm_subnet" "public_subnet" {
  name                 = "i2-lab-public-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.200.1.0/24"]
}

# Create a network security group
resource "azurerm_network_security_group" "i2-lab-nsg" {
  name                = "i2-lab-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

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
  subnet_id                 = azurerm_subnet.public_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create a public IP address
resource "azurerm_public_ip" "i2-lab-public_ip" {
  name                = "i2-lab-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

# Create a network interface
resource "azurerm_network_interface" "i2-lab-nic" {
  name                = "i2-lab-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.i2-lab-public_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.i2-lab-public_ip.id
  }
}

# Create a virtual machine
resource "azurerm_virtual_machine" "i2-lab-vm" {
  name                  = "i2-lab-vm"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.i2-lab-nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "i2-lab-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "i2-lab-vm"
    admin_username = "adminuser"
    admin_password = "i2-lab-Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# Create a virtual network gateway
resource "azurerm_virtual_network_gateway" "i2-lab-vng" {
  name                = "i2-lab-vng"
  location            = azurerm_resource_group.i2-lab-rg.location
  resource_group_name = azurerm_resource_group.i2-lab-rg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  sku {
    name = "VpnGw1"
    tier = "VpnGw1"
  }

  ip_configuration {
    name                          = "i2-lab-vng-ipconfig"
    public_ip_address_id          = azurerm_public_ip.i2-lab-public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.public_subnet.id
  }
}
