variable "resource_group_name" {
  type = string
}

variable "container_registry_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "allowed_ip_range_list" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "georeplication_locations" {
  type = list(string)
}

variable "tenant_id" {
  type = string
}

variable "devops_spn_appid" {
  type = string
}

variable "devops_spn_secret" {
  type = string
}

variable "subnet_id_list" {
  type = list(string)
}

variable "aks_subnet" {
  type = string
}

variable "isEngagement" {
  type = bool
}