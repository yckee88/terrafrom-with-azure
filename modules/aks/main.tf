resource "azurerm_resource_group" "rg" {
  name = var.resources_group_name
  location = var.location
  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "eclaims-aks" {
  name = var.name
  tags = azurerm_resource_group.rg.tags
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix = "${var.name}-dns"

  default_node_pool {
    
    name = "agentpool"
    node_count = 1
    vm_size = "Standard_B2s"
    temporary_name_for_rotation = "tempnode"

    }

  identity {type = "SystemAssigned"}

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}
