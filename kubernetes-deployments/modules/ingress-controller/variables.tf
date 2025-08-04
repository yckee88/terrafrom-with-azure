variable "name" {
      description = "The name of the Helm release."
      type        = string
}
    
variable "namespace" {
       description = "The Kubernetes namespace to deploy the ingress controller into."
       type        = string
}
   
variable "ingress_class_name" {
      description = "The name of the ingress class resource."
      type        = string
}
   
variable "chart_version" {
      description = "The version of the ingress-nginx Helm chart to deploy."
      type        = string
}
   
variable "load_balancer_rg" {
      description = "The name of the resource group containing the AKS node pool and its load balancer."
      type        = string
}