variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "dev_subscription_id" {
  type = string
  default = ""
}

variable "dev_client_id" {
  type = string
  default = ""
}

variable "dev_tenant_id" {
  type = string
  default = ""
}

variable "admin_password" {
  type = string
}

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

variable "tags" {
  type = map(string)
}

variable "corevnetname" {
  type = string
}

variable "corevnetrg" {
  type = string
}

variable "fw_ip" {
  type = string
}

variable "midserver_subnet_adress_space" {
  type = string
}

variable "mgmt_subnet_address_space" {
  type = string
}

variable "ad_subnet_address_space" {
  type = string
}

#VM
variable "ou_path" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_count" {
  type = string
}

variable "encryptapp_sp_name" {
  type = string
}

variable "encryptapp_keyvault_name" {
  type = string
}

variable "encryptapp_keyvault_rg" {
  type = string
}

variable "snow_spn_name" {
  type = string
}

variable "snow_spn_url" {
  type = string
}

variable "user_domain" {
  type = string
}