resource "azurerm_resource_group" "acr-rg" {
  name = var.resources_group_name
  location = var.location
  tags = var.tags
}


resource "azurerm_container_registry" "acr" {
  name = var.name
  resource_group_name = azurerm_resource_group.acr-rg.name
  location = azurerm_resource_group.acr-rg.location
  tags = var.tags
  sku = var.sku
  admin_enabled = true
}