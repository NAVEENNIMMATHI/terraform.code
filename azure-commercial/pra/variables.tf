variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

#ResourceGroup

variable "application_acronym" {}
variable "location_acronym" {}
variable "environment_acronym" {}
variable "location" {}
variable "tags" {
  type = map(string)
}

#Shared State Data Sources

variable "shared_state_storage_account_name" {}
variable "shared_state_storage_account_container_name" {}
variable "shared_state_storage_account_blob_key_name" {}
variable "shared_state_storage_account_access_key" {}

#App Service Environment

variable "app_service_environment_name" {}

#Network and Subnets
variable "dns_servers" {}


#Sql Server
variable "sql_server_admin_password" {}
variable "admin_password" {}

#ApplicationGateway
variable "app_gateway_environment_acronym" {}
variable "application_gateway_sku_name" {}
variable "application_gateway_sku_tier" {}
variable "application_gateway_sku_capacity" {}
variable "ase_internal_ip" {}
variable "backend_cer_cert_name" {}
variable "frontend_pfx_cert_name" {}
variable "frontend_pfx_cert_password" {}

#AD Groups
variable "encryptapp_sp_name" {}
variable "cloudops_keyvault_admin_group_name" {}
variable "client_keyvault_admin_group_name" {}

#StorageAccount
variable "agent_subnet_id" {}
variable "wvd_subnet_id" {}
variable "core_aks_subnet_id" {}

#Environment Settings

variable "restrict_gateway_endpoint" {}
variable "app_gateway_backend_info" {
  default = null
  type = object(
    {
    port = string
    request_timeout = string
  }
  )
}

#ADApplication

variable "tenant_fqdn" {}