variable "log_analytics_workspace" {
  type = string
  default = "{{ChangeMe}}"
  description = "The name of log analytics workspace"
}

variable "location" {
  type        = string
  default     = "{{ChangeMe}}"
  description = "The Azure Region to deploy resources."
}

variable "data_source_type" {
  type        = string
  default     = "customlogs"
  description = "The type of data source that the storage account is logging"
}

variable "resource_group" {
  type        = string
  default     = "{{ChangeMe}}"
  description = "The resource group to hold resources."
}

# variable "sku" {
#   type    = string
#   default = "Standard"
# }

# variable "retention_in_days" {
#   type = number
#   default = 7
#   description = "The number of days for retention"
# }

variable "storage_name" {
    type = string
}
variable "account_kind" {
    type      = string
    default   = "storage"
}

variable "account_tier" {
    type      = string
    default   = "standard" 
}

variable "account_replication_type" {
    type      = string
}