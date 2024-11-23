#Authentication

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

#environment specific variables

variable "environment" {
    type    = string
    default = ""
}

variable "environment_acronym" {
    type    = string
    default = ""
}

variable "location" {
    type    = string
    default = ""
}

variable "location_acronym" {
    type    = string
    default = ""
}

variable "application" {
    type    = string
    default = ""
}

variable "application_acronym" {
    type    = string
    default = ""
}
variable "tags" {
    type    = map(string)
}

#Virtual Machine

variable "application_environment_1" {
    type    = string
    default = ""
}

variable "vm_image_id" {
    type    = string
    default = ""
}

variable "count_value_bstnhosts" {
    type    = number
    default = 0
}

variable "custom_emails" {
    type    = string
    default = ""
}
variable "domain_name" {
    type    = string
    default = ""
}

variable "ou_path" {
    type    = string
    default = ""
}

variable "domain_user_name" {
    type    = string
    default = ""
}

variable "domain_user_password" {
    type    = string
    default = ""
}

variable "admin_password" {
    type    = string
    default = ""
}

variable "disk_encryption_client_secret" {
    type    = string
    default = ""
}

variable "count_value_appvm" {
    type    = number
    default = 0
}

variable "vm_workload_desc" {
    type    = string
    default = ""
}

#KeyVault

variable "eastus_acronym" {
    type    = string
    default = ""
}

variable "encryptapp_service_principal_name" {
    type    = string
    default = ""
}

variable "backupmanagement_service_principal_name" {
    type    = string
    default = ""
}

variable "cloudops_keyvault_admin_group_name" {
  type      = string
  default   = ""
}
variable "client_keyvault_admin_group_name" {
  type      = string
  default   = ""
}
variable "svc_cloweb_user_principal_name" {
  type      = string
  default   = ""
}
variable "tech_owner" {
  type      = string
  default   = ""
}
#App Service Plan

variable "app_service_plan_tier" {
    type    = string
    default = ""
}

variable "app_service_plan_size" {
    type    = string
    default = ""
}

variable "app_service_plan_capacity" {
    type    = number
    default = 0
}

#Application Gateway
variable "AppGatewaycertpassword" {
    type    = string
    default =""
}

variable "frontend_ip_configuration_name" {
    type    = string
    default = ""
}

variable "app_http_setting_name" {
    type    = string
    default =""
}

variable "app_backend_address_pool_name" {
    type    = string
    default = ""
}

variable "appgateway_sku" {
    type    = string
    default = ""
}

#Log Analytics

variable "loganalyticsrglocation" {
    type    = string
    default = ""
}

variable "subscription_acronym" {
    type    = string
    default = ""
}

#SQL Server

variable "clo_sql_admin_login" {
    type    = string
    default = ""
}

variable "clo_sql_admin_login_password" {
    type    = string
    default = ""
}

variable "clo_paas_sql_database_edition" {
    type    = string
    default = ""
}

variable "clo_paas_sql_database_collation" {
    type    = string
    default = ""
}

variable "clo_paas_sql_database_max_size_bytes" {
    type    = string
    default = ""
}

variable "clo_paas_sql_database_requested_service_objective_name" {
    type    = string
    default = ""
}

#Route Table

variable "next_hop_in_ip_address" {
    type    = string
    default = ""
}

#Virtual Network

variable "address_space" {
    type = list(string)
}

variable "dns_servers" {
    type = list(string)
}

variable "subnet_adress_space_cloappgw" {
    type = list(string)
}

variable "subnet_adress_space_clomgmt" {
    type = list(string)
}

variable "subnet_adress_space_cloweb" {
    type = list(string)
}

variable "hub_vnet_id" {
    type    = string
    default = ""
}

variable "transit_vnet_id" {
    type    = string
    default = ""
}

variable "hubsubscriptionid" {
    type    = string
    default = ""
}

variable "transitsubscriptionid" {
    type    = string
    default = ""
}

variable "hubvnetresourcegroup" {
    type    = string
    default = ""
}

variable "transitvnetresourcegroup" {
    type    = string
    default = ""
}

variable "hubvnetname" {
    type    = string
    default = ""
}

variable "transitvnetname" {
    type    = string
    default = ""
}

variable "cert_environment_acronym" {
    type    = string
    default = ""
}