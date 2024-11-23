
variable "environment" {
    type = "string"
}

variable "application_rg_location" {
    type = "string"
}

variable "resource_location" {
    type = "string"
}

variable "application_acronym"{
    type = "string"
}

variable "proj_poc_name" {
    type = "string"
}

variable "tags" {
   type    = "map"
}

variable "address_space" {
    type = "list"
}

variable "firewall_subnet_adress_space" {
    type = "string"
}

variable "worker_subnet_adress_space" {
    type = "string"
}

variable "bastion_subnet_adress_space" {
    type = "string"
}

variable "count_value" {
    type = "string"
}

variable "kpmg_NAT_ips" {
    type = "list"
}

variable  "encryptappsp_key_password" {
    type = "string"
}

variable "encryptapp_service_principal_name" {
    type = "string"
}

variable "keyvaultname" {
    type = "string"
}

#VirtualMachine
variable "application_name" {
    type = "string"
}

variable "application_acronym_1" {
    type = "string"
}

variable "vm_size" {
    type = "string"
}

variable "vm_environment" {
    type = "string"
}

variable "admin_password" {
    type = "string"
}

variable "custom_emails"{
   type = string
}

variable "group_object_id" {
    type = "string"
}

variable "CICDVmSubnet" {
    type = "string"
}

variable "WVDSubnet" {
    type = "string"
}

variable "default_subscription_id" {
    type = "string"
}

variable "application_environment" {
    type = "string"
}
