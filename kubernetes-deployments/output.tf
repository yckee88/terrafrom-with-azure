# Environment configuration for Ansible integration
output "environment_config" {
  description = "Environment configuration for Ansible"
  value = {
    for k, v in var.ingress_variables : 
    k => {
      namespace         = v.namespace
      ingress_class     = v.ingress_class_name
      service_name      = "${v.name}-ingress-nginx-controller"
      chart_version     = v.chart_version
    }
  }
}

# Simple list of environments for reference
output "available_environments" {
  description = "List of configured environments"
  value = keys(var.ingress_variables)
}
