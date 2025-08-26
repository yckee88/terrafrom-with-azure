resource "helm_release" "nginx_ingress" {
  name       = var.name
  namespace  = var.namespace
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  create_namespace = true

  values = [
    yamlencode({
      controller = {
        replicaCount = 2
        ingressClassResource = {
          name            = var.ingress_class_name
          default         = false
          controllerValue = "k8s.io/ingress-nginx-${var.namespace}"
        }
        service = {
          annotations = {
            "service.beta.kubernetes.io/azure-load-balancer-resource-group" = var.load_balancer_rg
            "service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path" = "/healthz"
          }
        }
        livenessProbe = {
          httpGet = {
            path = "/healthz"
            port = 10254
          }
        }
        readinessProbe = {
          httpGet = {
            path = "/healthz"
            port = 10254
          }
        }
      }
    })
  ]
}