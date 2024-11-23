variable "auto_grow_enabled" {
    type = bool
    default = true
    description = "{{ChangeMe}}"
}

variable "backup_retention_days" {
    type = number
    default = 7
    description = "{{ChangeMe}}"
}

variable "geo_redundant_backup_enabled" {
    type = bool
    default = true
    description = "{{ChangeMe}}"
}

variable "location" {
    type = string
    default = "eastus"
    description = "Regional location for postgresql_server resources"
}

variable "login" {
    type = string
    description = "Postgresql login username"
    sensitive = true
}

variable "name" {
    type = string
    description = "Name of the postgresql_server"
}

variable "password" {
    type = string
    description = "Postgresql login password"
    sensitive = true
}

variable "public_network_access_enabled" {
    type = bool
    default = false
    description = "{{ChangeMe}}"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group for the postgresql server"
}

variable "sku_name" {
    type = string
    default = "GP_Gen5_4"
    description = "{{ChangeMe}}"
}

variable "ssl_enforcement_enabled" {
    type = bool
    default = true
    description = "{{ChangeMe}}"
}

variable "ssl_minimal_tls_version_enforced" {
    type = string
    default = "TLS1_2"
    description = "{{ChangeMe}}"
}

variable "storage_mb" {
    type = number
    default = 640000
    description = "{{ChangeMe}}"
}

variable "tags" {
  description = "tags for all the resources"
}

variable "pg_version" {
    type = string
    default = "11"
    description = "{{ChangeMe}}"
}