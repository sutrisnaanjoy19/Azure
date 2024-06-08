terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "cloudflare" {
  api_token = var.api_token
}

output "vm-ip" {
  value = azurerm_public_ip.testing.ip_address
}

resource "azurerm_linux_virtual_machine" "testing" {
  name                            = "${var.resource_prefix}-vm"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = "Standard_F1"
  admin_username                  = var.admin_user
  disable_password_authentication = true
  admin_ssh_key {
    username   = var.admin_user
    public_key = file("/home/sushi/.ssh/Azure.pub")
  }
  network_interface_ids = [
    azurerm_network_interface.testing.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server-gen1"
    version   = "latest"
  }
}

# resource "azurerm_automanage_configuration" "testing" {
#   name                = "${var.resource_prefix}-cnf"
#   resource_group_name = var.resource_group_name
#   location            = var.location
# }

# resource "azurerm_virtual_machine_automanage_configuration_assignment" "testing" {
#   virtual_machine_id = azurerm_linux_virtual_machine.testing.id
#   configuration_id   = azurerm_automanage_configuration.testing.id
# }
