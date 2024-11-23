variable "resource_group_location" {
   default     = "__resource_group_location__"
}
variable "eastus_acronym" {
   default     = "__eastus_acronym__"
}
variable "tags" {
   type    = "map"

   default = {
		ApplicationName  = "__tag_ApplicationName__"
		BusinessOwner    = "__tag_BusinessOwner__"
		BusinessContact  = "__tag_BusinessContact__"
		CostCenter       = "__tag_CostCenter__"
		Environment      = "__tag_Environment__"
		Instance         = "__tag_Instance__"
		Platform         = "__tag_Platform__"
		Solution         = "__tag_Solution__"
		Node             = "__tag_Node__"
		Owner            = "__tag_Owner__"
		OwnerContact     = "__tag_OwnerContact__"
		TechnicalOwner   = "__tag_TechnicalOwner__"
		TechnicalContact = "__tag_TechnicalContact__"
		Version          = "__tag_Version__"
  }
}
variable "dns_server" {
  description = "The DNS servers to be used with vNet."
  default     = ["__dns_server1__","__dns_server2__","__dns_server3__"]
}
variable "address_space" {
   default=["__address_space__"]
}
variable "ablease_address_space" {
   default=["__ablease_address_space__"]
}
variable "address_space_single_value" {
   default = "__address_space_single_value__"
}
variable "source_address_prefix_ForRDP" {
   default = "__source_address_prefix_ForRDP__"
}
variable "destination_address_prefix_ForRDP" {
   default = "__destination_address_prefix_ForRDP__"
}
variable "storage_account_name" {
   default     = "__storage_account_name__"
}
variable "availability_set_name1" {
   default     = "__availability_set_name1__"
}
variable "availability_set_name2" {
   default     = "__availability_set_name2__"
}
variable "recovery_services_vault_name" {
   default     = "__recovery_services_vault_name__"
}
variable "recovery_services_protection_policy_name" {
   default     = "__recovery_services_protection_policy_name__"
}
variable "resource_group_name" {
   default     = "__resource_group_name__"
}
variable "backuprecovery_resource_group_name" {
   default     = "__backuprecovery_resource_group_name__"
}
variable "loganalytics_resource_group_name" {
   default     = "__loganalytics_resource_group_name__"
}
variable "sql_server_version" {
   default     = "__sql_server_version__"
}
variable "sqlserver_adgroup_group_name" {
   default     = "__sqlserver_adgroup_group_name__"
}
variable "sqlserver_adgroup_objectid" {
   default     = "__sqlserver_adgroup_objectid__"
}
variable "virtual_network_name" {
   default     = "__virtual_network_name__"
}
variable "disable_bgp_route_propagation" {
   default     = "__disable_bgp_route_propagation__"
}
variable "route_name" {
   default     = "__route_name__"
}
variable "route_address_prefix" {
   default     = "__route_address_prefix__"
}
variable "route_next_hop_type" {
   default     = "__route_next_hop_type__"
}
variable "route_next_hope_in_ip_address" {
   default     = "__route_next_hope_in_ip_address__"
}



# Domain Variables
variable "domain_name" {
   default = "__domain_name__"
}
variable "ou_path" {
   default = "__ou_path__"
}
variable "domain_user_name" {
   default     = "__domain_user_name__"
}
variable "domain_user_password" {
   default     = "__domain_user_password__"
}


# Disk Encryption Variables
variable "encryptappsp_key_password" {
   default     = "__encryptappsp_key_password__"
}
variable "custom_emails" {
   default=["__custom_emails__"]
}
variable "admin_password" {
   default = "__admin_password__"
}

variable "backupmanagement_service_principal_name" {
   default     = "__backupmanagement_service_principal_name__"
}


# COSPI Log Analytics Details
variable "cospi_log_analytics_workspace_name" {
   default     = "__cospi_log_analytics_workspace_name__"
}

variable "cospi_log_analytics_workspace_resource_group_name" {
   default     = "__cospi_log_analytics_workspace_resource_group_name__"
}

# encryptapp Service Principal Name
variable "encryptapp_service_principal_name" {
   default     = "__encryptapp_service_principal_name__"
}

# NSG Rules Variables
variable "ablaagw1_allow_port_443_source_address_prefixes" {
   default     = ["__ablaagw1_allow_port_443_source_address_prefixes__"]
}

variable "abladb1_allow_management_destination_port_ranges" {
   default     = ["__abladb1_allow_management_destination_port_ranges__"]
}

variable "outbound_abladb1_allow_management_destination_port_ranges" {
   default     = ["__outbound_abladb1_allow_management_destination_port_ranges__"]
}

# ABLA SQL UDR (Route Table) variable
variable "ablasql_routetable_name" {
   default     = "__ablasql_routetable_name__"
}
variable "ablaase_routetable_name" {
   default     = "__ablaase_routetable_name__"
}
variable "environment" {
   default = "__environment__"
}

variable "application_acronym" {
   default = "__application_acronym__"
}


# Network Security Groups Variables
variable "ablaagw1_nsg_name" {
   default     = "__ablaagw1_nsg_name__"
}
variable "ablaagw1_nsg_id" {
   default     = "__ablaagw1_nsg_id__"
}

variable "ablaapp1_nsg_name" {
   default     = "__ablaapp1_nsg_name__"
}
variable "ablaapp1_nsg_id" {
   default     = "__ablaapp1_nsg_id__"
}

variable "ablaase1_nsg_name" {
   default     = "__ablaase1_nsg_name__"
}
variable "ablaase1_nsg_id" {
   default     = "__ablaase1_nsg_id__"
}
variable "ablamgmt_nsg_id" {
   default = "__ablamgmt_nsg_id__"
}

# Virtual Network Variables
variable "ablaagw1_subnet_name" {
   default     = "__ablaagw1_subnet_name__"
}

variable "ablaagw1_subnet_address_prefix" {
   default     = "__ablaagw1_subnet_address_prefix__"
}

variable "ablaapp1_subnet_name" {
   default     = "__ablaapp1_subnet_name__"
}

variable "ablaapp1_subnet_address_prefix" {
   default     = "__ablaapp1_subnet_address_prefix__"
}

variable "ablaase1_subnet_name" {
   default     = "__ablaase1_subnet_name__"
}

variable "ablaase1_subnet_address_prefix" {
   default     = "__ablaase1_subnet_address_prefix__"
}
variable "ablamgmt_subnet_name" {
   default     = "__ablamgmt_subnet_name__"
}

variable "ablamgmt_subnet_address_prefix" {
   default     = "__ablamgmt_subnet_address_prefix__"
}
variable "app_gw_public_ip_name" {
   default     = "__app_gw_public_ip_name__"
}

variable "app_gw_sku_name" {
   default     = "__app_gw_sku_name__"
}

variable "app_gw_sku_tier" {
   default     = "__app_gw_sku_tier__"
}

variable "app_gw_sku_capacity" {
   default     = "__app_gw_sku_capacity__"
}

variable "appcertname" {
   default     = "__appcertname__"
}

variable "appcertpfxpwd" {
   default     = "__appcertpfxpwd__"
}

variable "kpimcertname" {
   default     = "__kpimcertname__"
}

variable "kpimcertpfxpwd" {
   default     = "__kpimcertpfxpwd__"
}

variable "restcertname" {
   default     = "__restcertname__"
}

variable "restcertpfxpwd" {
   default     = "__restcertpfxpwd__"
}

variable "meprestcertname" {
   default     = "__meprestcertname__"
}

variable "meprestcertpfxpwd" {
   default     = "__meprestcertpfxpwd__"
}

/********Application Gateway Variables *************/

variable "abla_agw_ase_ssl_cert_name2" {
  description = " The Name of the SSL certificate that is unique within this Application Gateway"
  type  = "string"
  default = "__abla_agw_ase_ssl_cert_name2__"
}
variable "abla_agw_ase_ssl_cert_name3" {
  description = " The Name of the SSL certificate that is unique within this Application Gateway"
  type  = "string"
  default = "__abla_agw_ase_ssl_cert_name3__"
}
variable "abla_agw_ase_ssl_cert_name4" {
  description = " The Name of the SSL certificate that is unique within this Application Gateway"
  type  = "string"
  default = "__abla_agw_ase_ssl_cert_name4__"
}

variable "abla_AppServiceFQDN" {
  description = "A list of FQDN's which should be part of the Backend Address Pool."
  type  = "list"
  default = ["__abla_AppServiceFQDN__"]
}

variable "abla_agw_name" {
  description = ""
  type  = "string"
  default = "__abla_agw_name__"
}

variable "abla_appcertpfxpwd" {
   default     = "__abla_appcertpfxpwd__"
}

variable "abla_workspace_name" {
  type = "string"
  default = "__abla_workspace_name__"
}

/************Elastic Pool variables*******************/

variable "abla_sql_elastic_pool_name" {
  type = "string"
  default = "__abla_sql_elastic_pool_name__"
}
variable "abla_sqlserver_admin" {
  type = "string"
  default = "__abla_sqlserver_admin__"
}
variable "abla_sqlserver_adminpassword" {
  type = "string"
  default = "__abla_sqlserver_adminpassword__"
}

/************End of Elastic Pool variables***********/

/****************start SQL Server   **********/
variable "abla_sql_server_name"
{
  type = "string"
  default = "__abla_sql_server_name__"
}

/**********end of SQL Server *******/

/****************start App Service plan  **********/
variable "ablaappserviceplan_name" {
  type = "string"
  default = "__ablaappserviceplan_name__"
}
variable "abla_asp01_tier" {
  type = "string"
  default = "__abla_asp01_tier__"
}
variable "abla_asp01_size" {
  type = "string"
  default = "__abla_asp01_size__"
}
variable "abla_asp_app_service_environment_id" {
  type = "string"
  default = "__abla_asp_app_service_environment_id__"
}
/**********end of App service plan*******/


/****************start App Service   **********/
variable "abla_ase_app_service_name" {
  type = "string"
  default = "__abla_ase_app_service_name__"
}

/**********end of App service *******/

/****************start App Insights   **********/
variable "abla_ase_app_insights_name" {
  type = "string"
  default = "__abla_ase_app_insights_name__"
}
/**********end of App Insights *******/

/************KeyVault variables*******************/
variable "abla_keyvault_name" {
  type = "string"
   default     = "__abla_keyvault_name__"
}

variable "abla_keyvault_user_obj_id" {
  description = "Objectid of existing AAD DC Administrators group or existing security group for ABLA Keyvault"
   default     = "__abla_keyvault_user_obj_id__"
}
/************End of KeyVault variables***********/

# Virtual Machine Count Variables
variable "count_value_ablaadminvm" {
   default = "__count_value_ablaadminvm__"
}
variable "count_value_ablabuildvm" {
   default = "__count_value_ablabuildvm__"
}

variable "eu-cis-hardened-win2016-20190111-image_name" {
   default     = "__eu-cis-hardened-win2016-20190111-image_name__"
}

variable "eu-cis-hardened-win2016-20190111-image_resource_group_name" {
   default     = "__eu-cis-hardened-win2016-20190111-image_resource_group_name__"
}

/********abla Server workstation01 Instance Variables *************/

variable "WIN2016-hardened-image" {
   default = "__WIN2016-hardened-image__"
}
variable "abla_buildvm_name_prefix1" {
  description = ""
  type  = "string"
  default = "__abla_buildvm_name_prefix1__"
}
variable "abla_buildvm_envmnt_prefix1" {
  description = ""
  type  = "string"
  default = "__abla_buildvm_envmnt_prefix1__"
}

variable "abla_buildvm_size" {
  description = ""
  type  = "string"
  default = "__abla_buildvm_size__"
}
variable "abla_buildvm_count" {
  description = ""
  type  = "string"
  default = "__abla_buildvm_size__"
}

variable "abla_buildvm_datadiskGB" {
  description = "Size of datadisk in GB"
  type  = "string"
  default = "__abla_buildvm_datadiskGB__"
}
variable "abla_buildvm_adminname" {
  default = "__abla_buildvm_adminname__"
}
variable "abla_buildvm_adminpassword" {
  type = "string"
  default = "__abla_buildvm_adminpassword__"
}

variable "abla_buildvm_domainname" {
  type = "string"
  default = "__abla_buildvm_domainname__"
}
variable "abla_buildvm_domainusername" {
  type = "string"
  default = "__abla_buildvm_domainusername__"
}
variable "abla_buildvm_domainpassword" {
  type = "string"
  description = "Password of the domain join account. Global admin"
  default = "__abla_buildvm_domainpassword__"
}

/********End of abla Server Pro Instance Variables *************/

/****************start ASE  **********/
variable "abla_ase_name" {
  type = "string"
  default = "__abla_ase_name__"
}
variable "abla_dnsSuffix" {
  type = "string"
  default = "__abla_dnsSuffix__"
}
/**********end of ASE*******/
