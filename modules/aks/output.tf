output "aks_kube_config" {
  description = "Value of the aks cube"
  value = azurerm_kubernetes_cluster.eclaims-aks.kube_config
  sensitive = true
}

output "node_resource_group" {
  description = "This is the node pool resources group"
  value = azurerm_kubernetes_cluster.eclaims-aks.node_resource_group

}

output "aks_principal_id" {
  description = "The Principal ID of the System Assigned Managed Identity assigned to this Kubernetes Cluster."
  value = azurerm_kubernetes_cluster.eclaims-aks.identity[0].principal_id
}
