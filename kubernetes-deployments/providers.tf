terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.infra.outputs.aks_host
  client_certificate     = base64decode(data.terraform_remote_state.infra.outputs.aks_client_certificate)
  client_key             = base64decode(data.terraform_remote_state.infra.outputs.aks_client_key)
  cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.aks_cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.infra.outputs.aks_host
    client_certificate     = base64decode(data.terraform_remote_state.infra.outputs.aks_client_certificate)
    client_key             = base64decode(data.terraform_remote_state.infra.outputs.aks_client_key)
    cluster_ca_certificate = base64decode(data.terraform_remote_state.infra.outputs.aks_cluster_ca_certificate)
  }
}