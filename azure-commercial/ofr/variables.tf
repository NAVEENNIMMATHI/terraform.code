variable "client_id" {
  type    = string
  default = ""
}

variable "client_secret" {
  type    = string
  default = ""
}

variable "subscription_id" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type    = string
  default = ""
}

variable "environment_acronym" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "location_acronym" {
  type    = string
  default = "use"
}

variable "resource_group_failover_location" {
  type    = string
  default = "eastus2"
}

variable "application_acronym" {
  type = string
}

variable "tags" {
  type = map(string)
}

##############App Service and Plan

variable "app_service_plan_tier" {
  type = string
}

variable "app_service_plan_size" {
  type = string
}

##############App Service Environment

variable "app_service_environment_id" {
  type = string
}

variable "ase_subnet_id" {
  type = string
}

variable "ase_name" {
  type = string
}

##############Virtual Network

variable "address_space" {
  type = list(string)
}

variable "dns_server" {
  type = list(string)
}

variable "app_subnet_address_prefixes" {
  type = list
}

variable "build_subnet_address_prefixes" {
  type = list
}

variable "agw_subnet_address_prefixes" {
  type = list
}

##############Virtual Network Peering

variable "core_subscription_id" {
  type = string
}

variable "core_vnet_resource_group" {
  type = string
}

variable "core_vnet_name" {
  type = string
}

##############Network Security Group


variable "app_gw_allowed_ip_range" {
  type        = list(string)
  description = "Type - List; Comma separated values"
}

##############Application Gateway

variable "application_gw_host_name" {
  type = string
}

variable "application_gw_sku_name" {
  type = string
}

variable "application_gw_sku_tier" {
  type = string
}

variable "application_gw_sku_capacity" {
  type = string
}

variable "application_gw_cert_name" {
  type = string
}

############## Key Vault ############

variable "ato_ofr_spn_client_secret" {
  type = string
}

variable "sql_server_admin_password" {
  type  = string
}

variable "unique_guid"{
  type = string
}

variable "ase_internal_ip"{
  type = string
}

variable "app_service_url"{
  type = string
}

variable "environment"{
  type = string
}

# Virtual Machine

variable "vm_admin_password" {
  type = string
}
variable "build_agent_subnet_id" {
  type = string
}

variable "aks_agent_subnet_id" {
  type = string
}

# Route Table

variable "firewall_ip_address" {
  type = string
}

# Keyvault Secrets
variable "build_agent_spn" {
  type = string
}

variable "azuread_applicationobjectid" {
  type = string
}

variable "azuread_clientid" {
  type = string
}

variable "azuread_serviceprincipalobjectid" {
  type = string
}

variable "azuread_tenantid" {
  type = string
}

variable "keyvault_url" {
  type = string
}

variable "logging_applicationinsights_loglevel_system" {
  type = string
}

variable "serilog_using_0" {
  type = string
}

variable "serilog_using_1" {
  type = string
}

variable "serilog_writeto_1_args_apikey" {
  type = string
}

variable "serilog_writeto_1_args_host" {
  type = string
}

variable "serilog_writeto_1_args_tags_0" {
  type = string
}