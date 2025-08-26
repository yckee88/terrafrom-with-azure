output "aks_host" {
  description = "The hostname of the AKS cluster."
  value       = module.aks.aks_kube_config[0].host
  sensitive   = true
}

output "aks_client_certificate" {
  description = "The client certificate for authenticating to the AKS cluster."
  value       = module.aks.aks_kube_config[0].client_certificate
  sensitive   = true
}

output "aks_client_key" {
  description = "The client key for authenticating to the AKS cluster."
  value       = module.aks.aks_kube_config[0].client_key
  sensitive   = true
}

output "aks_cluster_ca_certificate" {
  description = "The CA certificate for the AKS cluster."
  value       = module.aks.aks_kube_config[0].cluster_ca_certificate
  sensitive   = true
}

output "aks_node_resource_group" {
    description = "The name of the resource group where the AKS nodes are located."
    value = module.aks.node_resource_group
}

output "key_vault_id" {
  description = "The ID of the Key Vault."
  value       = module.keyvault.key_vault_id
}


output "aks_cluster_name" {
  description = "The name of the AKS cluster extracted from node resource group"
  value       = split("_", module.aks.node_resource_group)[2]
}

output "resource_group_name" {
  description = "The name of the resource group extracted from node resource group"
  value       = split("_", module.aks.node_resource_group)[1]
}

output "acr_login_server" {
  description = "ACR login server"
  value       = module.acr.acr_login_server
}

output "acr_id" {
  description = "ACR ID"
  value       = module.acr.acr_id
}

output "key_vault_name" {
  description = "The name of the Key Vault extracted from ID"
  value       = split("/", module.keyvault.key_vault_id)[8]
}

output "postgres_fqdn" {
  description = "PostgreSQL server FQDN"
  value       = module.postgres.postgres_fqdn
}

output "postgres_password_value" {
  description = "PostgreSQL admin password from Key Vault"
  value       = module.keyvault.postgres_password_value
  sensitive   = true
}

output "aks_principal_id" {
  description = "AKS principal ID for RBAC"
  value       = module.aks.aks_principal_id
}