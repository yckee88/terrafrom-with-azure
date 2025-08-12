variable "aks_name" {
  description = "This is the name of the aks cluster that we created"
  type = string
}

variable "location" {
    description = "Azure region for all service"
    type = string
}

variable "tags" {
  description = "tag used by the service"
  type = map(string)
}

variable "aks_resources_group" {
  description = "Name of the aks resources group"
  type = string
}



variable "acr_name" {
  description = "The name of ACR"
  type = string
}

variable "acr_resource_group_name" {
  description = "RG for ACR"
  type = string
}

variable "acr_sku" {
  description = "ACR SKU"
  type = string
  default = "Standard"
}

variable "postgres_name" {
  description = "Postgres db name"
  type = string
}

variable "postgres_resources_group_name" {
  description = "Postgres db name"
  type = string
}

variable "postgres_point_in_time_restore_time_utc" {
  description = "Time to restore from"
  type = string
  default = null
}

variable "postgres_create_mode" {
  description = "The mode to create the server. Defaults to 'Default'. Use 'PointInTimeRestore' to restore from a backup."
  type        = string
  default     = "Default"
}

variable "postgres_source_server_id" {
  description = "The resource ID of the source server to restore from. Required for Point-in-Time Restore."
  type        = string
  default     = null
}


variable "postgres_db_admin_login" {
  description = "login username of postgres"
  type = string
  sensitive = true
}

variable "postgres_allowed_ips" {
  description = "List of IP addresses/ranges allowed to connect to PostgreSQL"
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type = string
}

variable "key_vault_resource_group_name" {
  description = "The name of the resource group for the Key Vault."
  type = string
}
