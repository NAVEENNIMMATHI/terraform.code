# Authentication Varibles
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}

# Firewall Policy Variables
variable "tags" {
  type = map(string)
}

variable "environment_acronym_rg" {
  type = string
}

# Vnet Variables
variable "subnet_address_space_workload" {
  type = list(string)
}
variable "dr_workload_vnet_address_space" {
  type = list(string)
}
variable "dr_vnet_address_space" {
  type = list(string)
}
variable "subnet_address_space_dr_core1" {
  type = list(string)
}
variable "azure_firewall_private_ip" {
  type = string
}
variable "hub_vnet_dns_servers" {
  type = list(string)
}

# Project Variables
variable "environment_acronym" {
  type = string
}

variable "application_acronym" {
  type = string
}

variable "project_name" {
  type = string
}

variable "location_dr" {
  type = string
}

variable "location_dr_acronym" {
  type = string
}

# Sample Workload VM Variables
variable "dr_sample_workload_vms" {
  type = map(any)
}
# HA - DR
variable "ha_dr_hybwrk" {
  type = map(any)
}
variable "tags_ha_dr" {
  type = map(string)
}

variable "need_zones" {
   type = bool
}

# AKS Cluster Variables
variable "aks" {
  type = map
}

variable "aks_tags" {
  type = map
}

variable "aks_usw" {
  type = map
}

