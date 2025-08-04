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