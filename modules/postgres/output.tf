output "postgres_fqdn" {
  description = "domain name for postgres"
  value = azurerm_postgresql_flexible_server.eclaims-postgres.fqdn
}