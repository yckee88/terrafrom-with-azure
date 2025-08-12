terraform {
  required_providers {
    azapi = {
      source  = "azure/azapi"
    }
  }
}

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

# Wait for server to be fully operational before password update
resource "time_sleep" "wait_for_server" {
  count           = var.create_mode != "Default" ? 1 : 0
  create_duration = "3m"
  depends_on      = [azurerm_postgresql_flexible_server.eclaims-postgres]
}

# Update password after creation when restoring from source server
resource "azapi_update_resource" "update_password" {
  count       = var.create_mode != "Default" ? 1 : 0
  type        = "Microsoft.DBforPostgreSQL/flexibleServers@2023-03-01-preview"
  resource_id = azurerm_postgresql_flexible_server.eclaims-postgres.id

  body = {
    properties = {
      administratorLoginPassword = var.postgres_password_value
    }
  }

  depends_on = [time_sleep.wait_for_server]
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allowed_ips" {
  count            = length(var.allowed_ips)
  name             = var.allowed_ips[count.index].name
  server_id        = azurerm_postgresql_flexible_server.eclaims-postgres.id
  start_ip_address = var.allowed_ips[count.index].start_ip_address
  end_ip_address   = var.allowed_ips[count.index].end_ip_address
}

