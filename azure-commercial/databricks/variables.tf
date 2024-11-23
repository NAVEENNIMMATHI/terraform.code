# Authentication
variable "client_id" { 
    type = string
}
variable "client_secret" { 
    type = string
}
variable "subscription_id" { 
    type = string
}
variable "tenant_id" { 
    type = string    
}

# Project
variable "environment" {
    type = string
}
variable "environment_acronym" {
    type = string
}
variable "location" {
    type = string
}
variable "location_acronym" {
    type = string
}
variable "project" {
    type = string
}
variable "project_acronym" {
    type = string
}
variable "application_acronym" {
    type = string
}
variable "palo_alto_ip_address" {
    type = string
}
variable "azfirewall_ip_address" {
    type = string
}

variable "spi_vnet_name" { 
    type = string 
}
variable "spi_vnet_resource_group_name" { 
    type = string 
}
variable "spi_vnet_address_space" { 
    type = string 
}

variable "controlplane_address_space" { 
    type = string 
}
variable "sqlmi_address_space" { 
    type = string 
}
variable "webapp_address_space" { 
    type = string 
}

variable "security_role_sql_managed_instance" {
    type = string
}

variable "managedInstanceadministratorLogin" {
    type = string
}
variable "managedInstanceadministratorLoginPassword" {
    type = string
}

variable "tags" {
     type = map(string) 
}