output "key_vault_id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.kv.id
}

output "postgres_password_value" {
  description = "The value of the PostgreSQL password secret."
  value       = azurerm_key_vault_secret.postgres_password.value
  sensitive   = true
}