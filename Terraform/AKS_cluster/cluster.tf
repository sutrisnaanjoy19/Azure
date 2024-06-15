terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "Testing-aks-${var.suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "Testing-aks-k8s"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = "clusterpool"
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 5
    node_labels = {
      "size" = "B2s"
      "type" = "agent"
    }
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    cluster = "testing"
    AKS     = "testing"
  }
}
resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.default]
  filename   = "/home/sushi/.kube/config"
  content    = azurerm_kubernetes_cluster.default.kube_config_raw
}
