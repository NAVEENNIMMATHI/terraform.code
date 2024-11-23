#Auth Variables   
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

variable "environment" {
  type = string
}

variable "environment_acronym" {
  type = string
}

variable "application_acronym" {
  type = string
}

variable "location" {
  type = string
}

variable "location_acronym" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "service_principal_name" {
  type = string
}

#VM Variables
variable "vm_count" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "vm_admin_password" {
  type = string
}

variable "custom_emails" {
  type = string
}

#SQL Variables
variable "sql_server_admin_username" {
  type = string
}

variable "sql_server_admin_password" {
  type = string
}

#Subnet Variables
variable "vnet_address_space" {
  type = list(string)
}

variable "timapp_subnet_address_prefix" {
  type = string
}

variable "dns_servers" {
  type = list(string)
}

#Route Table Variables
variable "route_next_hop_in_ip_address" {
  type = string
}


#Transit Variables
variable "transit_vnet_name" {
  type = string
}

variable "transitvnet_resource_group_name" {
  type = string
}

variable "transittoappvnet_vnetpeering_name" {
  type = string
}

variable "transitsubscriptionid" {
  type = string
}

variable "transit_vnetpeering_name" {
  type = string
}

#Core Variables
variable "core_vnet_name" {
  type = string
}

variable "corevnet_resource_group_name" {
  type = string
}

variable "coretoappvnet_vnetpeering_name" {
  type = string
}

variable "coresubscriptionid" {
  type = string
}

variable "core_vnetpeering_name" {
  type = string
}
