variable "name" {
  description = "Postgres db name"
  type        = string
}

variable "location" {
  description = "Azure region for all service"
  type        = string
}

variable "resource_group_name" {
  description = "Postgres db name"
  type        = string
}

variable "db_admin" {
  description = "login username of postgres"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "tag used by the service"
  type        = map(string)
}

variable "postgres_password_value" {
  description = "The value of the PostgreSQL password."
  type        = string
  sensitive   = true
}

variable "create_mode" {
  description = "The mode to create the server. Defaults to 'Default'. Use 'PointInTimeRestore' to restore from a backup."
  type        = string
  default     = "Default"
}

variable "source_server_id" {
  description = "The resource ID of the source server to restore from. Required for Point-in-Time Restore."
  type        = string
  default     = null
}

variable "point_in_time_restore_time_utc" {
  description = "The UTC time to restore the server to. Required for Point-in-Time Restore."
  type        = string
  default     = null
}
