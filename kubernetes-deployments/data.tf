data "terraform_remote_state" "infra" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-example"
    storage_account_name = "stexample4517"
    container_name       = "tfstate"
    key                  = "eclaims.tfstate" # This MUST match the key from Stage 1
  }
}