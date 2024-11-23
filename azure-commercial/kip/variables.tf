#environment specific variables

variable "environment" {
  type    = string
  default = ""
}

variable "location_acronym" {
  type    = string
  default = ""

}

variable "environment_acronym" {
  type    = string
  default = ""

}
variable "app_url_acronym" {
  type    = string
  default = ""

}

variable "location" {
  type    = string
  default = ""
  
}

variable "application" {
  type    = string
  default = ""
}

variable "tags" {
  type = map(string)
}

variable "application_acronym" {
  type    = string
  default = ""
}

#service principal

variable "encryptapp_service_principal_name" {
  type    = string
  default = ""
}

variable "backupmanagement_service_principal_name" {
  type    = string
  default = ""
}

variable "agw1_subnet_adress_space" {
  type    = string
  default = ""
}

variable "app1_subnet_adress_space" {
  type    = string
  default = ""
}

variable "wst1_subnet_adress_space" {
  type    = string
  default = ""
}

variable "ase1_subnet_adress_space" {
  type    = string
  default = ""
}

variable "pbi1_subnet_adress_space" {
  type = string
}

variable "db1_subnet_adress_space" {
  type    = string
  default = ""
}

variable "adx1_subnet_adress_space" {
  type    = string
  default = ""
}


variable "kpimcapiq_subnet_address_space" {
  type    = string
  default = ""
}

variable "databricks_subnet_private_address_space" {
  type    = string
  default = ""
}

variable "databricks_subnet_public_address_space" {
  type    = string
  default = ""
}

variable "private_endpoint_subnet_address_space" {
  type    = string
  default = ""
}

variable "adf_int_runtime_subnet_address_space" {
  type    = string
  default = ""
}

variable "syn_int_runtime_subnet_address_space" {
  type    = string
  default = ""
}

variable "pvw_int_runtime_subnet_address_space" {
  type    = string
  default = ""
}

variable "address_space" {
  type = list(string)
}

variable "address_space_string_format" {
  type    = string
  default = ""
}

variable "dns_server" {
  type = list(string)
}

variable "coreinfrasubnetid" {
  type    = string
  default = ""
}

variable "core_aks_subnet_id" {
  type    = string
  default = ""
}

variable "rstudio_subnet_id" {
  type    = string
  default = ""
}

variable "squid_proxy_vm_subnet_id" {
  type    = string
  default = ""
}

variable "coresubscriptionid" {
  type    = string
  default = ""
}

variable  "synapseStartRange"{
  type = string
  default = ""
}

variable  "synapseEndRange"{
  type = string
  default = ""
}

variable "spidb1subnetid" {
  type    = string
  default = ""
}

variable "vmimagesubscriptionid" {
  type    = string
  default = ""
}

variable "corevnetresourcegroup" {
  type    = string
  default = ""
}

variable "corevnetname" {
  type    = string
  default = ""
}

#App Service Environment
variable "dns_suffix" {
  type    = string
  default = ""
}

variable "ase_name" {
  type    = string
  default = ""
}
#Application Insights

variable "app_insights_name_kipdev" {
  type    = string
  default = ""
}

variable "app_insights_name_kiprestdev" {
  type    = string
  default = ""
}

variable "app_insights_name_kipqa" {
  type    = string
  default = ""
}

variable "app_insights_name_kiprestqa" {
  type    = string
  default = ""
}

variable "app_insights_name_mep-kipdev" {
  type    = string
  default = ""
}

variable "app_insights_name_meprest-kipdev" {
  type    = string
  default = ""
}

variable "app_insights_name_mep-kipqa" {
  type    = string
  default = ""
}

variable "app_insights_name_meprest-kipqa" {
  type    = string
  default = ""
}

variable "app_insights_name_dasnp" {
  type    = string
  default = ""
}

variable "app_insights_name_dasrestnp" {
  type    = string
  default = ""
}

variable "account_type" {
  type    = string
  default = ""
}

variable "is_hns_enabled" {
  type = bool
}

variable "account_tier" {
  type    = string
  default = ""
}

variable "account_tier2" {
  type    = string
  default = ""
}

variable "account_kind" {
  type    = string
  default = ""
}

variable "replication_type" {
  type    = string
  default = ""
}

variable "replication_type2" {
  type    = string
  default = ""
}

# Vm count value

variable "count_value_wst1vm" {
  type    = string
  default = ""
}

variable "vm_size_wst1vm" {
  type    = string
  default = ""
}

variable "data_disk_size_wst1vm" {
  type    = string
  default = ""
}

variable "count_value_app1vm" {
  type    = string
  default = ""
}

variable "vm_size_app1vm" {
  type    = string
  default = ""
}

variable "data_disk_size_app1vm" {
  type    = string
  default = ""
}

variable "count_value_app2vm" {
  type    = string
  default = ""
}

variable "vm_size_app2vm" {
  type    = string
  default = ""
}

variable "data_disk_size_app2vm" {
  type    = string
  default = ""
}

variable "count_value_pbi1vm" {
  type    = string
  default = ""
}

variable "vm_size_pbi1vm" {
  type    = string
  default = ""
}

variable "data_disk_size_pbi1vm" {
  type    = string
  default = ""
}

variable "count_value_adf1vm" {
  type    = string
  default = ""
}

variable "vm_size_adf1vm" {
  type    = string
  default = ""
}

variable "data_disk_size_adf1vm" {
  type    = string
  default = ""
}

variable "count_value_syn1vm" {
  type    = string
  default = ""
}

variable "vm_size_syn1vm" {
  type    = string
  default = ""
}

variable "data_disk_size_syn1vm" {
  type    = string
  default = ""
}

variable "count_value_pvw1vm" {
  type    = string
  default = ""
}

variable "vm_size_pvw1vm" {
  type    = string
  default = ""
}

variable "data_disk_size_pvw1vm" {
  type    = string
  default = ""
}

variable "count_value_kpimcapiqvm" {
  type    = string
  default = ""
}

variable "vm_size_kpimcapiqvm" {
  type    = string
  default = ""
}

variable "data_disk_size_kpimcapiqvm" {
  type    = string
  default = ""
}

variable "count_value_analytics" {
  type    = string
  default = ""
}

variable "vm_size_analytics" {
  type    = string
  default = ""
}

variable "vm_admin_password" {
  type    = string
  default = ""
}

variable "application_gw_sku_name" {
  type    = string
  default = ""
}

variable "application_gw_sku_tier" {
  type    = string
  default = ""
}

variable "application_gw_sku_capacity" {
  type    = string
  default = ""
}

variable "kipdevhostname" {
  type    = string
  default = ""
}

variable "kipdevauthcertcer" {
  type    = string
  default = ""
}

variable "kipdevcertname" {
  type    = string
  default = ""
}

variable "kipdevsslcertpfx" {
  type    = string
  default = ""
}

variable "kipdevcertpfxpwd" {
  type    = string
  default = ""
}

variable "kiprestdevhostname" {
  type    = string
  default = ""
}

variable "kiprestdevauthcertcer" {
  type    = string
  default = ""
}

variable "kiprestdevcertname" {
  type    = string
  default = ""
}

variable "kiprestdevsslcertpfx" {
  type    = string
  default = ""
}

variable "kiprestdevcertpfxpwd" {
  type    = string
  default = ""
}

variable "kipqahostname" {
  type    = string
  default = ""
}

variable "kipqaauthcertcer" {
  type    = string
  default = ""
}

variable "kipqacertname" {
  type    = string
  default = ""
}

variable "kipqasslcertpfx" {
  type    = string
  default = ""
}

variable "kipqacertpfxpwd" {
  type    = string
  default = ""
}

variable "kiprestqahostname" {
  type    = string
  default = ""
}

variable "kiprestqaauthcertcer" {
  type    = string
  default = ""
}

variable "kiprestqacertname" {
  type    = string
  default = ""
}

variable "kiprestqasslcertpfx" {
  type    = string
  default = ""
}

variable "kiprestqacertpfxpwd" {
  type    = string
  default = ""
}

variable "mep-kipdevhostname" {
  type    = string
  default = ""
}

variable "mep-kipdevauthcertcer" {
  type    = string
  default = ""
}

variable "mep-kipdevcertname" {
  type    = string
  default = ""
}

variable "mep-kipdevsslcertpfx" {
  type    = string
  default = ""
}

variable "mep-kipdevcertpfxpwd" {
  type    = string
  default = ""
}

variable "meprest-kipdevhostname" {
  type    = string
  default = ""
}

variable "meprest-kipdevauthcertcer" {
  type    = string
  default = ""
}

variable "meprest-kipdevcertname" {
  type    = string
  default = ""
}

variable "meprest-kipdevsslcertpfx" {
  type    = string
  default = ""
}

variable "meprest-kipdevcertpfxpwd" {
  type    = string
  default = ""
}

variable "mep-kipqahostname" {
  type    = string
  default = ""
}

variable "mep-kipqaauthcertcer" {
  type    = string
  default = ""
}

variable "mep-kipqacertname" {
  type    = string
  default = ""
}

variable "mep-kipqasslcertpfx" {
  type    = string
  default = ""
}

variable "mep-kipqacertpfxpwd" {
  type    = string
  default = ""
}

variable "meprest-kipqahostname" {
  type    = string
  default = ""
}

variable "meprest-kipqaauthcertcer" {
  type    = string
  default = ""
}

variable "meprest-kipqacertname" {
  type    = string
  default = ""
}

variable "meprest-kipqasslcertpfx" {
  type    = string
  default = ""
}

variable "meprest-kipqacertpfxpwd" {
  type    = string
  default = ""
}

variable "dasnphostname" {
  type    = string
  default = ""
}

variable "dasnpauthcertcer" {
  type    = string
  default = ""
}

variable "dasnpcertname" {
  type    = string
  default = ""
}

variable "dasnpsslcertpfx" {
  type    = string
  default = ""
}

variable "dasnpcertpfxpwd" {
  type    = string
  default = ""
}

variable "dasrestnphostname" {
  type    = string
  default = ""
}

variable "dasrestnpauthcertcer" {
  type    = string
  default = ""
}

variable "dasrestnpcertname" {
  type    = string
  default = ""
}

variable "dasrestnpsslcertpfx" {
  type    = string
  default = ""
}

variable "dasrestnpcertpfxpwd" {
  type    = string
  default = ""
}

variable "selfsigncertname" {
  type    = string
  default = ""
}

variable "selfsignauthcertcer" {
  type    = string
  default = ""
}

# app service plan

variable "app_service_environment_id" {
  type    = string
  default = ""
}

variable "asp_tier" {
  type    = string
  default = ""
}

variable "asp_size" {
  type    = string
  default = ""
}

variable "asp_capacity" {
  type    = string
  default = ""
}

#sql server and elastic pool

variable "sqladmin_group_name" {
  type    = string
  default = ""
}

variable "kip_sql_dwh_performance_level" {
  type    = string
  default = ""  
}

variable "thirdpartydata_sql_dwh_performance_level" {
  type    = string
  default = ""  
}

variable "kip_synapse_dwh_performance_level" {
  type    = string
  default = ""  
}

variable "thirdpartydata_synapse_dwh_performance_level" {
  type    = string
  default = ""  
}

variable "kpmgproprietarydata_synapse_dwh_performance_level" {
  type    = string
  default = ""  
}

variable "sqlserveradmin_password" {
  type    = string
  default = ""
}

variable "PaloInboundIPAddress" {
  type    = string
  default = ""
}
variable "azfirewall_ip_address" {
  type    = string
  default = ""
}

variable "ase_internal_ip" {
  type    = string
  default = ""
}

variable "uniqueresourcesuffix" {
  type    = string
  default = ""
}

#Network Security Rule

variable "PaloAlto1" {
  type    = string
  default = ""
}

variable "PaloAlto2" {
  type    = string
  default = ""
}

variable "KPMG_On-Premise" {
  type    = string
  default = ""
}

variable "KPMG_VPN" {
  type = list(string)
}

variable "KGS_Bangalore" {
  type = list(string)
}

variable "KGS_Gurgaon" {
  type    = string
  default = ""
}

variable "ASE_PIP" {
 type = list(string)
}

variable "AZFW_PIP" {
   type = list(string)
}

variable "Shared_DA_ASE_PIP" {
   type = list(string)
}

variable "AGW_PIP" {
  type = list(string)
}
variable "ADX_Mgmt_IP" {
  type    = string
  default = ""
}

variable "adx_healthmonitor_ip" {
  type    = list(string)
}

#Global RDS Group Name

variable "GlobalRDSGroup_name" {
  type    = string
  default = ""
}

# Managed Instance

variable "managedInstanceName" {
  type    = string
  default = ""
}

variable "managedInstanceadministratorLogin" {
  type    = string
  default = ""
}

variable "managedInstanceadministratorLoginPassword" {
  type    = string
  default = ""
}

variable "managedInstanceskuName" {
  type    = string
  default = ""
}

variable "managedInstancevCores" {
  type    = string
  default = ""
}

variable "managedInstancestorageSizeInGB" {
  type    = string
  default = ""
}

variable "managedInstancelicenseType" {
  type    = string
  default = ""
}

# Storage Account Container

variable "webappbackup_container_name" {
  type    = string
  default = ""
}

#App Services

variable "app_service_name_kipdev" {
  type    = string
  default = ""
}

variable "app_service_name_kiprestdev" {
  type    = string
  default = ""
}

variable "app_service_name_mep-kipdev" {
  type    = string
  default = ""
}

variable "app_service_name_meprest-kipdev" {
  type    = string
  default = ""
}

variable "app_service_name_kipqa" {
  type    = string
  default = ""
}

variable "app_service_name_kiprestqa" {
  type    = string
  default = ""
}

variable "app_service_name_mep-kipqa" {
  type    = string
  default = ""
}

variable "app_service_name_meprest-kipqa" {
  type    = string
  default = ""
}

variable "app_service_name_dasnp" {
  type    = string
  default = ""
}

variable "app_service_name_dasrestnp" {
  type    = string
  default = ""
}

variable "functionapp_name_dev" {
  type    = string
  default = ""
}

variable "functionapp_name_qa" {
  type    = string
  default = ""
}

variable "windows_services_vm_name" {
  type    = string
  default = ""
}

# Custom RBAC Variables

variable "RBAC_CustomWebsiteContributor_Name" {
  type    = string
  default = ""
}

variable "RBAC_CustomSQLManagedInstanceContributor_Name" {
  type    = string
  default = ""
}

variable "RBAC_CustomStorageAccountContributor_Name" {
  type    = string
  default = ""
}

variable "RBAC_CustomKeyVaultRead_Name" {
  type    = string
  default = ""
}

variable "RBAC_CustomSQLDBContributor_Name" {
  type    = string
  default = ""
}

variable "RBAC_CustomDataFactoryDeployer_Name" {
  type    = string
  default = ""
}

#KME Subnet Access for DataLake

variable "kme_ase_subnet_id" {
  type    = string
  default = ""
}

variable "kme_admin_subnet_id" {
  type    = string
  default = ""
}

variable "client_id" {
  type    = string
  default = ""

}
variable "client_secret" {
  type    = string
  default = ""

}
variable "subscription_id" {
  type    = string
  default = ""

}
variable "tenant_id" {
  type    = string
  default = ""

}

variable "os_disk_override" {
  type = map(string)
  default = {
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }  
}

variable "data_disk_1_override" {
  default = null

  type = object(
    {
    create_option     = string
    managed_disk_type = string
    disk_size_gb      = string
  }
  )
}

variable "data_disk_2_override" {
  default = null

  type = object(
    {
    create_option     = string
    managed_disk_type = string
    disk_size_gb      = string
  }
  )
}

variable "data_disk_3_override" {
  default = null

  type = object(
    {
    create_option     = string
    managed_disk_type = string
    disk_size_gb      = string
  }
  )
}

variable "data_disk_4_override" {
  default = null

  type = object(
    {
    create_option     = string
    managed_disk_type = string
    disk_size_gb      = string
  }
  )
}

variable "data_disk_5_override" {
  default = null

  type = object(
    {
    create_option     = string
    managed_disk_type = string
    disk_size_gb      = string
  }
  )
}

variable "project_name" {
  type    = string
  default = "APP"
}

variable "storage_os_disk" {
  type    = string
  default = ""
}

variable "storage_data_disk_1" {
  type    = string
  default = ""
}

variable "storage_data_disk_2" {
  type    = string
  default = ""
}

variable "storage_data_disk_3" {
  type    = string
  default = ""
}

variable "storage_data_disk_4" {
  type    = string
  default = ""
}

variable "storage_data_disk_5" {
  type    = string
  default = ""
}

variable "enforce_private_link_endpoint_network_policies" {
  type    = bool
  default = false
}
variable "cognitive_service" {
  type    = string
  default = ""
}

variable "cognitive_search" {
  type    = string
  default = ""
}

variable "partition_count" {
  type    = number
  default = 1
}
variable "replica_count" {
  type    = number
  default = 1
}

variable "kipprivatedns"{
  type    = string
  default = ""
}

variable "kme_appsubnet"{
  type    = string
  default = ""
}

variable "kme_mgmtsubnet"{
  type    = string
  default = ""
}

variable "kme_buildsubnet"{
  type    = string
  default = ""
}

variable "spi_appsubnet"{
  type    = string
  default = ""
}

variable "adx_min_instance_count"{
  type    = number
  }

variable "adx_max_instance_count"{
  type    = number
  }

  variable "adx_database_name"{
    type    = string
    default = ""
  }

  variable "adx_database_cache_period"{
    type    = string
    default = ""
  }

   variable "adx_database_retention_period"{
    type    = string
    default = ""
  }

  variable "kip_adf_contributers"{
    type    = string
    default = ""
    
  }

  variable "adx_database_principal_name"{
    type    = string
    default = ""
  }

  variable "ip_rules" {
    type    = string
    default = ""
  }

  variable "ip_rules_datavault" {
    type    = string
    default = ""
  }

  variable "ip_rules_raw" {
    type    = string
    default = ""
  }
  #Application Gateway
variable "kiphostname" {
    type    = string
    default = ""
}

variable "kiprestsslce" {
  type    = string
  default = ""
}

variable "kipauthcertcer" {
  type    = string
  default = ""
}

variable "kipcertname" {
  type    = string
  default = ""
}

variable "kipsslcertpfx" {
  type    = string
  default = ""
}

variable "kipcertpfxpwd" {
  type    = string
  default = ""
}

variable "kipresthostname" {
  type    = string
  default = ""
}

variable "kiprestauthcertcer" {
  type    = string
  default = ""
}

variable "kiprestcertname" {
  type    = string
  default = ""
}

variable "kiprestsslcertpfx" {
  type    = string
  default = ""
}

variable "kiprestcertpfxpwd" {
  type    = string
  default = ""
}

variable "mep-kiphostname" {
  type    = string
  default = ""
}

variable "mep-kipauthcertcer" {
  type    = string
  default = ""
}

variable "mep-kipcertname" {
  type    = string
  default = ""
}

variable "mep-kipsslcertpfx" {
  type    = string
  default = ""
}

variable "mep-kipcertpfxpwd" {
  type    = string
  default = ""
}

variable "meprest-kiphostname" {
  type    = string
  default = ""
}

variable "meprest-kipauthcertcer" {
  type    = string
  default = ""
}

variable "meprest-kipcertname" {
  type    = string
  default = ""
}

variable "meprest-kipsslcertpfx" {
  type    = string
  default = ""
}

variable "meprest-kipcertpfxpwd" {
  type    = string
  default = ""
}

#App Services
variable "app_service_name_kip" {
  type    = string
  default = ""
}

variable "app_service_name_kiprest" {
  type    = string
  default = ""
}

variable "app_service_name_mep-kip" {
  type    = string
  default = ""
}

variable "app_service_name_meprest-kip" {
  type    = string
  default = ""
}

#Application Insights
variable "app_insights_name_kipuat" {
  type    = string
  default = ""
}

variable "app_insights_name_kiprestuat" {
  type    = string
  default = ""
}

variable "app_insights_name_mep-kipuat" {
  type    = string
  default = ""
}

variable "app_insights_name_meprest-kipuat" {
  type    = string
  default = ""
}

#Application Gateway
variable "kipuathostname" {
  type    = string
  default = ""
}

variable "kipuatauthcertcer" {
  type    = string
  default = ""
}

variable "kipuatcertname" {
  type    = string
  default = ""
}

variable "kipuatsslcertpfx" {
  type    = string
  default = ""
}

variable "kipuatcertpfxpwd" {
  type    = string
  default = ""
}

variable "kiprestuathostname" {
  type    = string
  default = ""
}

variable "kiprestuatauthcertcer" {
  type    = string
  default = ""
}

variable "kiprestuatcertname" {
  type    = string
  default = ""
}

variable "kiprestuatsslcertpfx" {
  type    = string
  default = ""
}

variable "kiprestuatcertpfxpwd" {
  type    = string
  default = ""
}

variable "mep-kipuathostname" {
  type    = string
  default = ""
}

variable "mep-kipuatauthcertcer" {
  type    = string
  default = ""
}

variable "mep-kipuatcertname" {
  type    = string
  default = ""
}

variable "mep-kipuatsslcertpfx" {
  type    = string
  default = ""
}

variable "mep-kipuatcertpfxpwd" {
  type    = string
  default = ""
}

variable "meprest-kipuathostname" {
  type    = string
  default = ""
}

variable "meprest-kipuatauthcertcer" {
  type    = string
  default = ""
}

variable "meprest-kipuatcertname" {
  type    = string
  default = ""
}

variable "meprest-kipuatsslcertpfx" {
  type    = string
  default = ""
}

variable "meprest-kipuatcertpfxpwd" {
  type    = string
  default = ""
}

#App Services
variable "app_service_name_kipuat" {
  type    = string
  default = ""
}

variable "app_service_name_kiprestuat" {
  type    = string
  default = ""
}

variable "app_service_name_mep-kipuat" {
  type    = string
  default = ""
}

variable "app_service_name_meprest-kipuat" {
  type    = string
  default = ""
}

variable "functionapp_name_uat" {
  type    = string
  default = ""
}

variable "functionapp_name" {
  type    = string
  default = ""
}

variable "spidatabrickssubnetid" {
  type    = string
  default = ""
}

variable "app_gateway_switch" {
  default = null
  type = object(
    {
    port = string
    request_timeout = string
  }
  )
}
variable "wvd_subnet_id" {
  type    = string
  default = ""
}

variable "managed_disk_type" {
  type    = string
  default = ""
}

variable "private_dns_zone_subscription" {
  type    = string
  default = ""
}

variable "private_dns_zone_blob" {
  type    = string
  default = ""
}

variable "private_dns_zone_resource_group" {
  type    = string
  default = ""
}

variable "private_dns_zone_servicebus" {
  type    = string
  default = ""
}

variable "private_dns_zone_queue" {
  type    = string
  default = ""
}

variable "private_dns_zone_purview" {
  type    = string
  default = ""
}

variable "private_dns_zone_purviewstudio" {
  type    = string
  default = ""
}

variable "private_link_accesses" {
  type = list(string)
  default = []
}

#Private DNS
variable "pvt_dns_subscription_id" {
  type    = string
  default = ""
}

variable "pvt_dns_environment_acronym" {
  type    = string
  default = ""
}

#Arcgis Variables for PEP
variable "gis_vnet_name" { type = string }
variable "gis_vnet_rg_name" { type = string }
variable "pep_subnet_name" { type = string }