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
variable "tags" {
  type = map(string)
}

variable "GCDevelopers_description" {
  type= string
}
variable "ServiceAccounts" {
  type = string
}

variable "ServiceAccountsllp" {
  type = string
}

variable "restrict_gateway_endpoint" {
  type = string
}
variable "d365Servicesaccount_password" {
  type = string
}
variable "d365ServicesaccountUser" {
  type = string
}

variable "tenantfqdn" {
  type = string
}

variable "encryptapp_sp_name" {
  type = string
}

variable "cloudops_keyvault_admin_group_name" {
  type = string
}

variable "client_keyvault_admin_group_name" {
  type = string 
}

variable "sastype" {
  type = string
}



