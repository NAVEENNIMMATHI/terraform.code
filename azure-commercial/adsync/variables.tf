variable "tenant_id" { type = string }
variable "subscription_id" { type = string }
variable "client_id" { type = string }
variable "client_secret" { type = string }

#Environment
variable "location" { type = string }
variable "location_acronym" { type = string }
variable "environment" { type = string }
variable "environment_acronym" { type = string }
variable "application" { type = string }
variable "application_acronym" { type = string }
variable "tags" { type = map(string) }

#App Service
variable "app_service_environment_name" { type = string }
variable "coresubscriptionid" { type = string }
variable "corevnetresourcegroup" { type = string }
variable "corevnetname" { type = string }
variable "coreasesubnet" { type = string }

#Key Vault
variable "keyvault_aadsyncspn_obj_id" { type = string }

#Function App
variable "active_directory_client_id" { type = string }