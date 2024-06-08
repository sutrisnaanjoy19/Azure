
resource "azurerm_virtual_network" "testing" {
  name                = "${var.resource_prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "testing" {
  name                 = "${var.resource_prefix}-internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.testing.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "testing" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "ghost"
  }
}

resource "azurerm_network_interface" "testing" {
  name                = "${var.resource_prefix}-ANI"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.testing.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.testing.id
  }
}

