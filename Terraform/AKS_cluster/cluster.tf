provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "Testing-aks"
  location            = "East US"
  resource_group_name = "Azure-testing"
  dns_prefix          = "Testing-aks-k8s"
  kubernetes_version  = "1.28.9"

  default_node_pool {
    name                = "clusterpool"
    vm_size             = "Standard_A2_v2"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 5
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    cluster = "testing"
    AKS = "testing"
  }
}