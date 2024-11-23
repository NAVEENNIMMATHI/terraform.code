variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "account_replication_type" {
  default = "LRS"
  type    = string
}

variable "enable_https_traffic_only" {
  default = true
  type    = bool
}

variable "account_tier" {
  default = "Standard"
  type    = string
}

variable "enable_advanced_threat_protection" {
  default = ""
  type    = string
}

variable "virtual_network_subnet_ids" {
  type = list(string)

  default = []
}

variable "account_kind" {
  type = string

  default = "StorageV2"
}

variable "tags" {
  type = map(string)
}

variable "network_rule_default_action" {
  type    = string
  default = "Deny"
}

variable "kpmg_nat_ip_list" {
  type    = list(string)
  default = []
}

variable "is_hns_enabled" {
  type    = bool
  default = false
}

variable "delete_retention_policy_days" {
  type    = number
  default = null
}

variable "large_file_share_enabled" {
  type    = bool
  default = null
}

# variable "allow_blob_public_access" {
#   type    = bool
#   default = false
# }

variable "azure_files_authentication_directory_type" {
  type    = string
  default = null
}

variable "private_link_accesses" {
  type = list(string)
  default = []
}