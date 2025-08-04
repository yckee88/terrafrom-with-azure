variable "resources_group_name" {
  description = "The name of ACR "
  type = string
}

variable "location" {
  description = "Location of ACR"
  type = string
}

variable "tags" {
  description = "tags for ACR"
  type = map(string)
}

variable "sku" {
  description = "SKU size of ACR"
  type = string
}

variable "name" {
  description = "name of the ACR crated"
  type = string
}


