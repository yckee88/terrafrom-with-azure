variable "resources_group_name" {
  description = "The name of the rg group"
  type = string
}

variable "name" {
    description = "The name of the aks created"
    type = string 
}

variable "location" {
  description = "Region/Location of the aks created"
  type = string
}

variable "tags" {
  description = "Tag for the service that created"
  type = map(string)
  default     = {}
}