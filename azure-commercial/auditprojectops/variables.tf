
#ResourceGroup

variable "application_acronym" {
  type = string
}
variable "location_acronym" {
  type = string
}
variable "environment_acronym" {
  type = string
}
variable "location" {
  type = string
}

#Backend Variables

variable "tenant_id" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}

variable "vm_admin_password" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "wvd_subnet_id" { 
  type = string
}

variable "agent_subnet_id" { 
  type = string 
}

variable "kpmg_nat_ip_list" { 
  type = list(string) 
}

variable "powerapps_whitelist_ips" { 
  type = list(string) 
}

variable "tenant_fqdn" {
  type = string
}

variable "d365_service_account_user" {
  type = string
}

variable "d365_service_account_password" {
  type = string
}

variable "co_service_accounts_group_name" {
  type = string
}

