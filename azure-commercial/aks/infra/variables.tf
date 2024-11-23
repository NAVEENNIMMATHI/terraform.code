variable "resource_group_name" {
  description = "the resource group name"
  default     = "kpmg-aks-rg-null"
  type        = string
}

variable "location" {
  description = "the location for the resource group and all the resources"
  default     = "eastus"
  type        = string
}

variable "tags" {
  description = "tags for all the resources"
  default     = {
    environment = "Development"
  }
}

variable "tenant_id" { type = string }
variable "subscription_id" { type = string }
variable "client_id" { type = string }
variable "client_secret" { type = string }

variable "storage_name" { type = string }
variable "log_analytics_storage_name" { type = string }
variable "log_analytics_workspace_name" { type = string }
variable "acr_name" { type = string }
variable "key_vault_name" { type = string }
variable "aks_cluster_name" { type = string }
variable "hub_vnet_name" { type = string }
variable "aks_vnet_name" { type = string }
variable "postgresql_login" { type = string }
variable "postgresql_password" { type = string }
variable "postgresql_name" { type = string }