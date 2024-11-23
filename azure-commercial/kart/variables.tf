#Authentication
variable "client_id" { type = string }

variable "client_secret" { type = string }

variable "subscription_id" { type = string }

variable "tenant_id" { type = string }

#Project Details
variable "application" { type = string }

variable "application_acronym" { type = string }

#Environment Specific Variables
variable "target_deployment_environment" { type = string }

variable "KART_Central_Connection_String" { type = string }

variable "fun_environment" { type = string } 

variable "email_id" { type = string }

variable "environment" { type = string }

variable "environment_acronym" { type = string }

variable "application_url_environment_acronym" { type = string }

variable "location" { type = string }

variable "location_acronym" { type = string }

variable "tags" {
  type = map(string)
}

#Data Sources
variable "spi_route_table_name" { type = string }

variable "spi_route_table_resource_group_name" { type = string }

variable "cospi_log_analytics_workspace_name" { type = string }

variable "cospi_log_analytics_workspace_resource_group_name" { type = string }

variable "encryptapp_service_principal_name" { type = string }

variable "backupmanagement_service_principal_name" { type = string }

variable "cloudops_keyvault_admin" { type = string }

variable "client_keyvault_admin" { type = string }

variable "keyvaultadminsgroupname" { type = string }

#Action Group
variable "action_group_name" { type = string }

variable "custom_emails" { type = string }

#AD Application
variable "krt_app_registration_name" { type = string }

variable "reply_urls" {
  type = list(string)
}

#AD Group
variable "KRTDevelopers_description" { type = string }

variable "analysisadminsgroupname" { type = string }

variable "BuildVMAdmins_description" { type = string }

variable "RDPUsers_description" { type = string }

variable "ATOTeam_description" { type = string }

variable "BusinessUsers_description" { type = string }

variable "DevopsProjectManagers_description" { type = string }

variable "PBICapacityAdmins_description" { type = string }

variable "PBIWorkspaceMembers_name" { type = string }

variable "PBIWorkspaceMembers_description" { type = string }

variable "PBIWorkspaceAdmins_name" { type = string }

variable "PBIWorkspaceAdmins_description" { type = string }

variable "ProjectTeam_description" { type = string }

variable "SQLReadOnlyDev_description" { type = string }

variable "sqlserver_admingroup_name" { type = string }

variable "sqlserver_admingroup_name_description" { type = string }

variable "development_group_name" { type = string }

variable "development_group_name_description" { type = string }

#AD User
variable "analysisservice_admin_username" { type = string }

variable "analysisservice_admin_user_password" { type = string }

variable "tenantfqdn" { type = string }

#Analysis Service
variable "automation_account_app_id" { type = string }

variable "analysis_services_admins_name" { type = string }

variable "ipv4_firewall_rules" {
  type = list(map(string))
  default = []
}

#App Service Plan
variable "asp_tier" { type = string }

variable "asp_size" { type = string }

#Application Gateway
variable "app_gateway_hostname" { type = string }

variable "ase_cert_name" { type = string }

variable "app_gateway_certname" { type = string }

variable "ase_internal_ip" { type = string }

# variable "selfsigncertname" { type = string }

# variable "selfsignauthcertcer" { type = string }

#App Service Environment
variable "dns_suffix" { type = string }

#Keyvault
variable "krtbuildvm_objectid" { type = string }

#Network Security Rule
variable "KPMG_Trusted_NW_address_prefixes" {
  type = list(string)
}

#Network Security Rule for Azure Firewall
variable "kpmg_trusted_az_fw_nw_address_prefixes" {
  type = list(string)
}

#Route Table
variable "next_hop_in_ip_address" { type = string }

#Sql Elastic Pool
variable "sql_elastic_pool_max_size" { type = string }

variable "sqlelasticpool_sku_name" { type = string }

variable "sqlelasticpool_sku_tier" { type = string }

variable "sqlelasticpool_sku_family" { type = string }

variable "sqlelasticpool_sku_capacity" { type = string }

variable "sqlelasticpool_min_capacity" { type = string }

variable "sqlelasticpool_max_capacity" { type = string }

#Sql Server
variable "sql_server_admin_username" { type = string }

variable "sqlserveradmin_password" { type = string }

variable "spiappsubnetid" { type = string }

#Storage Account
variable "account_type" { type = string }

variable "account_tier" { type = string }

variable "replication_type" { type = string }

variable "kpmg_nat_ip_list" {
  type = list(string)
}

variable "pre_kpmg_nat_ip_list" {
  type = list(string)
}

variable "post_kpmg_nat_ip_list" {
  type = list(string)
}

variable "arch_kpmg_nat_ip_list" {
  type = list(string)
}

variable "coreinfrasubnetid" { type = string }

variable "wvd_subnet_id" { type = string }

variable "kartsharename" { type = string }

variable "core_aks_subnet_id" { type = string }

variable "squid_proxy_vm_subnet" { type = string }

#Subnet
variable "krtagw1_subnet_adress_space" { type = string }

variable "krtapp1_subnet_adress_space" { type = string }

variable "krtase1_subnet_adress_space" { type = string }

#Virtual Machine
variable "count_value_krtapp1vm" { type = string }

variable "count_value_krtwrkstnvm" { type = string }

variable "vm_size_app" { type = string }

variable "vm_size_wrkstn" { type = string }

variable "admin_password" { type = string }

#Virtual Network
variable "address_space" {
  type = list(string)
}

variable "dns_server" {
  type = list(string)
}

#Virtual Network Peering
variable "coresubscriptionid" { type = string }

variable "transitsubscriptionid" { type = string }

variable "newcoresubscriptionid" { type = string }

variable "corevnetresourcegroup" { type = string }

variable "transitvnetresourcegroup" { type = string }

variable "newcorevnetresourcegroup" { type = string }

variable "corevnetname" { type = string }

variable "transitvnetname" { type = string }

variable "newcorevnetname" { type = string }

#Azure Firewall Private IP
variable "azfirewall_ip_address" { type = string }