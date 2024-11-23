variable "acr_name" {
    type = string
    description = "{{ChangeMe}}"
}

variable "admin_enabled" {
    type = bool
    default = false
    description = "{{ChangeMe}}"
}

variable "cluster_location" {
    type = string
    description = "{{ChangeMe}}"
}

variable "tags" {
  description = "tags for all the resources"
}

variable "resource_group_name" {
    type = string
    description = "{{ChangeMe}}"
}

variable "sku" {
    type = string
    default = "Basic"
    description = "{{ChangeMe}}"
}