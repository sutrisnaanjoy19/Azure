provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "testing" {
  name     = "testing-vm"
  location = "East Asia"
}

resource "azurerm_virtual_network" "testing" {
  name                = "testing-network"
  resource_group_name = azurerm_resource_group.testing.name
  location            = azurerm_resource_group.testing.location
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.testing.name
  virtual_network_name = azurerm_virtual_network.testing.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_network_security_group" "testing" {
  name                = "allow-ssh"
  location            = azurerm_resource_group.testing.location
  resource_group_name = azurerm_resource_group.testing.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_public_ip" "public_ip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.testing.name
  location            = azurerm_resource_group.testing.location
  allocation_method   = "Dynamic"
}
resource "azurerm_linux_virtual_machine_scale_set" "testing" {
  name                = "testing-vms"
  resource_group_name = azurerm_resource_group.testing.name
  location            = azurerm_resource_group.testing.location
  sku                 = "Standard_B1s"
  instances           = 1
  admin_username      = "azure"
  #   eviction_policy     = "Deallocate"
  #   priority            = "Spot"
  #   max_bid_price = 0.5
  admin_ssh_key {
    username   = "azure"
    public_key = file("/home/sushi/.ssh/Azure.pub")
  }


  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server-gen1"
    version   = "latest"
  }

  network_interface {
    name                      = "interface"
    primary                   = true
    network_security_group_id = azurerm_network_security_group.testing.id

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.internal.id

    }
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
