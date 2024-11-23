variable "access_policy_key_permissions" {
    type = list(string)
    default = [
        "get"
    ]
    description = "{{ChangeMe}}"
}

variable "access_policy_secret_permissions" {
    type = list(string)
    default = [
        "get"
    ]
    description = "{{ChangeMe}}"
}

variable "access_policy_storage_permissions" {
    type = list(string)
    default = [
        "get"
    ]
    description = "{{ChangeMe}}"
}

variable "azure_location" {
    type = string
    default = "eastus"
    description = "Azure location/region for the key vault resource to be created"
}

variable "enabled_for_disk_encryption" {
    type = bool
    default = true
    description = "{{ChangeMe}}"
}

variable "key_vault" {
    type = string
    description = "The name of the Key Vault"
}

variable "object_id" {
    type = string
    description = "{{ChangeMe}}"
}

variable "purge_protection_enabled" {
    type = bool
    default = false
    description = "{{ChangeMe}}"
}

variable "resource_group" {
    type = string
    description = "The resource group for the key vault to be created in"
}

variable "sku_name" {
    type = string
    default = "standard"
    description = "{{ChangeMe}}"
}

variable "tags" {
  description = "tags for all the resources"
}

variable "tenant_id" {
    type = string
    description = "{{ChangeMe}}"
}