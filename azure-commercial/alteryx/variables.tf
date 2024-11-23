variable "client_id" {
	type = string
}
variable "subscription_id" {
	type = string
}
variable "tenant_id" {
	type = string
}


variable "tags" {
	type = map(string)
}


#Database Configuration
variable "sql_server_version" {
	type = string
}
variable "sql_server_admin_username" {
	type = string
}


#Key Vaults
variable "keyvault_name" {
	type = string
}
variable "keyvault_admin_group_name" {
	type = string
}


#Miscellaneus Settings
variable "uniqueresourcesuffix" {
	type = string
}


#Network and Subnets
variable "alteryx_address_space" {
	type = string
}


#Secrets
variable "client_secret" {
	type = string
}
variable "shared_state_storage_account_access_key" {
	type = string
}
variable "sqlserveradmin_password" {
	type = string
}
variable "vmpassword" {
	type = string
}


#Shared State Configuration
variable "shared_state_storage_account_name" {
	type = string
}
variable "shared_state_storage_account_container_name" {
	type = string
}
variable "shared_state_storage_account_blob_key_name" {
	type = string
}


#Targets
variable "application_name" {
	type = string
}
variable "application_rg_location" {
	type = string
}
variable "deployment_environment" {
	type = string
}

variable "location_acronym" {
	type = string
}
variable "application_acronym" {
	type = string
}
variable "environment_acronym" {
	type = string
}

#Virtual Machines
variable "UEMCALTERYX1P1_name" {
	type = string
}

#Virtual Machines
variable "os_name" {
	type = string
}


variable "UEMCALTERYX1P1_vm_size" {
	type = string
}
variable "wkstn_vm_image_id" {
	type = string
}



variable "route_table_name" { 
	type = string
}
 variable "route_table_rg_name" { 
	 type = string
	  }

variable "restrict_gateway_endpoint" {
 
}
