resource "azurerm_resource_group" "rg-db" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_postgresql_flexible_server" "eclaims-postgres" {
  name                = var.name
  resource_group_name = azurerm_resource_group.rg-db.name
  location            = azurerm_resource_group.rg-db.location
  tags                = var.tags

  administrator_login    = var.db_admin
  administrator_password = var.postgres_password_value

  storage_mb = 32768
  sku_name   = "B_Standard_B1ms"
  version    = "16"
  zone       = "1"

  create_mode                       = var.create_mode
  source_server_id                  = var.source_server_id
  point_in_time_restore_time_in_utc = var.point_in_time_restore_time_utc
}