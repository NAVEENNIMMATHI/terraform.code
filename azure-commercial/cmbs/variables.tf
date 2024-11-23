variable "client_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "location" {
  type = string
}

variable "location_acronym" {
  type = string
}

variable "application_acronym" {
  type = string
}

variable "environment" {
  type = string
}

variable "environment_acronym" {
  type = string
}

variable "function_env" {
  type = string
}

variable "tags" {
  type = map(string)
}


# App Service Plan   

variable "app_service_plan_size" {
  type = string
}


# App Insights

variable "ase_name" {
  type = string
}

variable "sharedrg_resource_group_name" {
  type = string
}

# App Gateway

variable "cmbs_appgateway_subnet_address_prefix" {
  type = string
}

variable "app_gateway_hostname" {
  type = string
}

variable "agw_cert_name" {
  type = string
}

variable "agw_cert_cer" {
  type = string
}

variable "agw_cert_pfx" {
  type = string
}

variable "app_gateway_certpfx_password" {
  type = string
}

variable "ase_internal_ip" {
  type = string
}


# SQL Server 

variable "sqlserveradmin_password" {
  type = string
}

variable "dbedition" {
  type = string
}

variable "requested_service_objective_name" {
  type = string
}


# Private Endpoint

variable "shared_vnet_name" {
  type = string
}

variable "shared_resource_group_name" {
  type = string
}

variable "cmbs_privateendpoint_subnet_address_prefix" {
  type = string
}


# NSG Variables

variable "source_address_prefixes" {
  type = list(string)
}

/* this will have data from Shared RAS State File */

variable "shared_state_resource_group_name" {
  type = string
}

variable "shared_state_storage_account_name" {
  type = string
}

variable "shared_state_storage_account_blob_key_name" {
  type = string
}

variable "shared_state_storage_account_access_key" {
  type = string
}


#  Storage Account

variable "agent_subnet_id" {
  type = string
}

variable "wvd_subnet_id" {
  type = string
}

variable "client_keyvault_admin_name" {
  type = string
}

variable "core_aks_subnet_id" {
  type = string
}

variable "automation_sp_name" {
  type = string
}