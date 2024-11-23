variable "client_id" { type = string }
variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

variable "tags" { type = map(string) }

#Secrets
variable "client_secret" { type = string }
variable "shared_state_storage_account_access_key" { type = string }
variable "sqlserveradmin_password" { type = string }
variable "vmpassword" { type = string }

#Shared State Configuration
variable "shared_state_storage_account_name" { type = string }
variable "shared_state_storage_account_container_name" { type = string }
variable "shared_state_storage_account_blob_key_name" { type = string }

#Targets
variable "application_name" { type = string }
variable "application_rg_location" { type = string }
variable "deployment_environment" { type = string }

variable "environment" { type = string }

variable "location_acronym" { type = string }
variable "application_acronym" { type = string }
variable "application_acronym_spi" { type = string }
variable "environment_acronym" { type = string }
variable "environment_acronym_aad_app" { type = string }

variable "tabappgw_address_space" { type = string }
variable "tabext_address_space" { type = string }

variable "spi_web_subnet_address_space" { type = string }
variable "spi_app_subnet_address_space" { type = string }

variable "route_table_name" { type = string }
variable "route_table_rg_name" { type = string }

variable "appgateway_sku" { type = string }
variable "AppGatewaycertpassword" {
  type    = string
  default = ""
}

variable "tableau_server_vm_size" { type = string }
variable "tableau_server_vm_image_id" { type = string }