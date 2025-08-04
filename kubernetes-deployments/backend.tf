terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-example"
    storage_account_name = "stexample4517"
    container_name       = "tfstate"
    key                  = "kubernetes.tfstate" # Using a different key for Stage 2 state
  }
}
