variable "subscription_id" {
  type    = string
}
variable "client_id" {
  type    = string
}
variable "client_secret" {
  type    = string
}
variable "tenant_id" {
  type    = string
}
variable "uniqueguid" {
  type = string
}
#ResourceGroup

variable "application_acronym" {
  type    = string
}
variable "location_acronym" {
  type    = string
}
variable "environment_acronym" {
  type    = string
}
variable "location" {
  type    = string
}
variable "tags" {
  type = map(string)
}

#Shared State Data Sources

variable "shared_state_storage_account_name" {
  type    = string
}
variable "shared_state_storage_account_container_name" {
  type    = string
}
variable "shared_state_storage_account_blob_key_name" {
  type    = string
}
variable "shared_state_storage_account_access_key" {
  type    = string
}

#App Service Environment

variable "app_service_environment_name" {
  type    = string
}

#Network and Subnets
variable "dns_servers" {
  type    = list
}


#Sql Server
variable "sql_server_admin_password" {
  type    = string
}
variable "admin_password" {
  type    = string
}



#ApplicationGateway
variable "app_gateway_environment_acronym" {
  type    = string
}
variable "application_gateway_sku_name" {
  type    = string
}
variable "application_gateway_sku_tier" {
  type    = string
}
variable "application_gateway_sku_capacity" {
  type    = string
}
variable "ase_internal_ip" {
  type    = string
}
variable "backend_cer_cert_name" {
  type    = string
}
variable "frontend_pfx_cert_name" {
  type    = string
}
variable "frontend_pfx_cert_password" {
  type    = string
}

#AD Groups
variable "encryptapp_sp_name" {
  type    = string
}
variable "cloudops_keyvault_admin_group_name" {
  type    = string
}
variable "client_keyvault_admin_group_name" {
  type    = string
}

#StorageAccount
variable "agent_subnet_id" {
  type    = string
}
variable "wvd_subnet_id" {
  type    = string
}

#Environment Settings

variable "restrict_gateway_endpoint" {
  type    = string
}
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

variable "tenant_fqdn" {
  type    = string
}