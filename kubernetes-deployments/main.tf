module "ingress_controller" {
  for_each = var.ingress_variables
  source   = "./modules/ingress-controller"

  name                = each.value.name
  namespace           = each.value.namespace
  chart_version       = each.value.chart_version
  ingress_class_name  = each.value.ingress_class_name
  load_balancer_rg    = data.terraform_remote_state.infra.outputs.aks_node_resource_group
}