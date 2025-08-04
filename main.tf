module "aks" {
    source = "./modules/aks"
    name = var.aks_name
    location = var.location
    resources_group_name = var.aks_resources_group
    tags = var.tags
}



module "acr" {
    source = "./modules/acr"
    name = var.acr_name
    location = var.location
    resources_group_name = var.acr_resource_group_name
    tags = var.tags
    sku = var.acr_sku
}


module "postgres" {
  source = "./modules/postgres"
  name = var.postgres_name
  location = var.location
  resource_group_name = var.postgres_resources_group_name
  db_admin = var.postgres_db_admin_login
  tags = var.tags
  postgres_password_value = module.keyvault.postgres_password_value
  create_mode = var.postgres_create_mode
  source_server_id = var.postgres_source_server_id
  point_in_time_restore_time_utc = var.postgres_point_in_time_restore_time_utc
}

resource "random_password" "postgres_password" {
  length           = 16
  special          = true
  override_special = "_@%+"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

module "keyvault" {
  source = "./modules/keyvault"
  key_vault_name = var.key_vault_name
  resource_group_name = azurerm_resource_group.rg_keyvault.name
  location = var.location
  tags = var.tags
  postgres_password = random_password.postgres_password.result
}

resource "azurerm_resource_group" "rg_keyvault" {
  name     = var.key_vault_resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = module.acr.acr_id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.aks_principal_id
  depends_on = [
    module.aks,
    module.acr
  ]
}