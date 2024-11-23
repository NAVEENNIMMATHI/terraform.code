variable "storage_name" {
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "location" {
  type        = string
  default     = "eastus"
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

variable "container_name" {
    type = string
}