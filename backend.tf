terraform {
  backend "azurerm" {
    resource_group_name = "rg-terraform-example"
    storage_account_name = "stexample4517"
    container_name = "tfstate"
    key = "eclaims.tfstate"
  }
}