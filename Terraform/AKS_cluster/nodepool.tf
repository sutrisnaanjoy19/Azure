resource "azurerm_kubernetes_cluster_node_pool" "E2ads_v5_nodepool" {
  name                  = "workerpoole"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.default.id
  vm_size               = "Standard_E2ads_v5"
  #vnet_subnet_id        = azurerm_subnet.public_subnet.id
  priority            = "Spot"
  spot_max_price      = 0.5
  enable_auto_scaling = true
  node_count          = 1
  min_count           = 0
  max_count           = 5
  max_pods            = 20
  node_labels = {
    "size" = "E2ads_v5"
    "type" = "worker"
  }

}

output "id" {
  value = resource.azurerm_kubernetes_cluster_node_pool.E2ads_v5_nodepool.id
}

