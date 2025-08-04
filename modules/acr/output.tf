output "acr_login_server" {
  description = "ACR login server"
  value = azurerm_container_registry.acr.login_server
}

output "acr_id" {
  description = "The ID of the ACR instance."
  value = azurerm_container_registry.acr.id
}