#environment specific variables

variable "target_deployment_environment" {
  type = string
}

variable "environment" {
  type = string
}

variable "environment_dev" {
  type = string
}

variable "environment_qa" {
  type = string
}

variable "environment_uat" {
  type = string
}

variable "application_environment_1" {
  type = string
}

variable "application_environment_2" {
  type = string
}

variable "eastus_acronym" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "application_acronym" {
  type = string
}


#Resource Group

variable "backuprecovery_rg_name" {
  type = string
}

variable "loganalytics_rg_name" {
  type = string
}

variable "application_rg_name" {
  type = string
}

variable "loganalytics_rg_location" {
  type = string
}

variable "backuprecovery_rg_location" {
  type = string
}

variable "application_rg_location" {
  type = string
}


#service principal

variable "encryptapp_service_principal_name" {
  type = string
}

variable "backupmanagement_service_principal_name" {
  type = string
}


#route table

variable "spi_route_table_name" {
  type = string
}

variable "spi_route_table_resource_group_name" {
  type = string
}


#virtual network and subnet

variable "virtual_network_name" {
  type = string
}

variable "agw1_subnet_name" {
  type = string
}

variable "agw1_subnet_adress_space" {
  type = string
}

variable "app1_subnet_name" {
  type = string
}

variable "app1_subnet_adress_space" {
  type = string
}

variable "wst1_subnet_name" {
  type = string
}

variable "wst1_subnet_adress_space" {
  type = string
}

variable "ase1_subnet_name" {
  type = string
}

variable "ase1_subnet_adress_space" {
  type = string
}

variable "pbi1_subnet_name" {
  type = string
}

variable "pbi1_subnet_adress_space" {
  type = string
}

variable "db1_subnet_name" {
  type = string
}

variable "db1_subnet_adress_space" {
  type = string
}

variable "adx1_subnet_name" {
  type = string
}

variable "adx1_subnet_adress_space" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "address_space_string_format" {
  type = string
}

variable "dns_server" {
  type = list(string)
}

variable "coreinfrasubnetid" {
  type = string
}

variable "core_aks_subnet_id" {
  type = string
}

variable "coresubscriptionid" {
  type = string
}

variable "spidb1subnetid" {
  type = string
}

variable "transitsubscriptionid" {
  type = string
}

variable "vmimagesubscriptionid" {
  type = string
}

variable "corevnetresourcegroup" {
  type = string
}

variable "transitvnetresourcegroup" {
  type = string
}

variable "corevnetname" {
  type = string
}

variable "transitvnetname" {
  type = string
}

variable "applicationvnetddosprotectionplan"{
    type = string
  }

#Network Security Groups

variable "nsg_name_agw1" {
  type = string
}

variable "nsg_name_app1" {
  type = string
}

variable "nsg_name_wst1" {
  type = string
}

variable "nsg_name_ase1" {
  type = string
}

variable "nsg_name_pbi1" {
  type = string
}

variable "nsg_name_db1" {
  type = string
}

variable "nsg_name_adx1" {
  type = string
}



#RecoveryService

variable "recovery_service_name" {
  type = string
}


#App Service Environment

variable "dns_suffix" {
  type = string
}

variable "ase_name" {
  type = string
}

variable "app_service_plan_name" {
  type = string
}


#Application Insights

variable "app_insights_name_kipdev" {
  type = string
}

variable "app_insights_name_kiprestdev" {
  type = string
}

variable "app_insights_name_kipqa" {
  type = string
}

variable "app_insights_name_kiprestqa" {
  type = string
}

variable "app_insights_name_mep-kipdev" {
  type = string
}

variable "app_insights_name_meprest-kipdev" {
  type = string
}

variable "app_insights_name_mep-kipqa" {
  type = string
}

variable "app_insights_name_meprest-kipqa" {
  type = string
}

variable "app_insights_name_dasnp" {
  type = string
}

variable "app_insights_name_dasrestnp" {
  type = string
}


#Storage Account

variable "storage_account_name_recovery" {
  type = string
}

variable "storage_account_name_dialog" {
  type = string
}

variable "storage_account_name_vmdialog" {
  type = string
}

variable "storage_account_name_webapp_backup" {
  type = string
}

variable "storage_account_name_app" {
  type = string
}

variable "storage_account_name_app_log" {
  type = string
}

variable "account_type" {
  type = string
}

variable "account_type_2" {
  type = string
}

variable "is_hns_enabled" {
  type = bool
}

variable "account_tier" {
  type = string
}

variable "replication_type" {
  type = string
}


# Vm count value

variable "count_value_wst1vm" {
  type = string
}

variable "vm_size_wst1vm" {
  type = string
}

variable "data_disk_size_wst1vm" {
  type = string
}

variable "count_value_app1vm" {
  type = string
}

variable "vm_size_app1vm" {
  type = string
}

variable "data_disk_size_app1vm" {
  type = string
}

variable "count_value_app2vm" {
  type = string
}

variable "vm_size_app2vm" {
  type = string
}

variable "data_disk_size_app2vm" {
  type = string
}

variable "count_value_pbi1vm" {
  type = string
}

variable "vm_size_pbi1vm" {
  type = string
}

variable "data_disk_size_pbi1vm" {
  type = string
}

variable "vm_admin_password" {
  type = string
}


#Application Gateway

variable "app_gateway_pip_name" {
  type = string
}

variable "app_gateway_name" {
  type = string
}

variable "application_gw_sku_name" {
  type = string
}

variable "application_gw_sku_tier" {
  type = string
}

variable "application_gw_sku_capacity" {
  type = string
}

variable "kipdevhostname" {
  type = string
}

variable "kipdevauthcertcer" {
  type = string
}

variable "kipdevcertname" {
  type = string
}

variable "kipdevsslcertpfx" {
  type = string
}

variable "kipdevcertpfxpwd" {
  type = string
}

variable "kiprestdevhostname" {
  type = string
}

variable "kiprestdevauthcertcer" {
  type = string
}

variable "kiprestdevcertname" {
  type = string
}

variable "kiprestdevsslcertpfx" {
  type = string
}

variable "kiprestdevcertpfxpwd" {
  type = string
}

variable "kipqahostname" {
  type = string
}

variable "kipqaauthcertcer" {
  type = string
}

variable "kipqacertname" {
  type = string
}

variable "kipqasslcertpfx" {
  type = string
}

variable "kipqacertpfxpwd" {
  type = string
}

variable "kiprestqahostname" {
  type = string
}

variable "kiprestqaauthcertcer" {
  type = string
}

variable "kiprestqacertname" {
  type = string
}

variable "kiprestqasslcertpfx" {
  type = string
}

variable "kiprestqacertpfxpwd" {
  type = string
}

variable "mep-kipdevhostname" {
  type = string
}

variable "mep-kipdevauthcertcer" {
  type = string
}

variable "mep-kipdevcertname" {
  type = string
}

variable "mep-kipdevsslcertpfx" {
  type = string
}

variable "mep-kipdevcertpfxpwd" {
  type = string
}

variable "meprest-kipdevhostname" {
  type = string
}

variable "meprest-kipdevauthcertcer" {
  type = string
}

variable "meprest-kipdevcertname" {
  type = string
}

variable "meprest-kipdevsslcertpfx" {
  type = string
}

variable "meprest-kipdevcertpfxpwd" {
  type = string
}

variable "mep-kipqahostname" {
  type = string
}

variable "mep-kipqaauthcertcer" {
  type = string
}

variable "mep-kipqacertname" {
  type = string
}

variable "mep-kipqasslcertpfx" {
  type = string
}

variable "mep-kipqacertpfxpwd" {
  type = string
}

variable "meprest-kipqahostname" {
  type = string
}

variable "meprest-kipqaauthcertcer" {
  type = string
}

variable "meprest-kipqacertname" {
  type = string
}

variable "meprest-kipqasslcertpfx" {
  type = string
}

variable "meprest-kipqacertpfxpwd" {
  type = string
}

variable "dasnphostname" {
  type = string
}

variable "dasnpauthcertcer" {
  type = string
}

variable "dasnpcertname" {
  type = string
}

variable "dasnpsslcertpfx" {
  type = string
}

variable "dasnpcertpfxpwd" {
  type = string
}

variable "dasrestnphostname" {
  type = string
}

variable "dasrestnpauthcertcer" {
  type = string
}

variable "dasrestnpcertname" {
  type = string
}

variable "dasrestnpsslcertpfx" {
  type = string
}

variable "dasrestnpcertpfxpwd" {
  type = string
}

variable "selfsigncertname" {
  type = string
}

variable "selfsignauthcertcer" {
  type = string
}


# app service plan

variable "app_service_environment_id" {
  type = string
}

variable "asp_tier" {
  type = string
}

variable "asp_size" {
  type = string
}

variable "asp_capacity" {
  type = string
}


#sql server and elastic pool

variable "sqladmin_group_name" {
  type = string
}

variable "sql_server_name" {
  type = string
}

variable "sypnase_analyticsdev1_name" {
  type = string
}

variable "sypnase_analyticsdev1_performance_level" {
  type = string
}

variable "sqlserveradmin_password" {
  type = string
}

variable "ase_routetable_name" {
  type = string
}

variable "mi_routetable_name" {
  type = string
}

variable "PaloInboundIPAddress" {
  type = string
}


#KeyVault

variable "key_vault_name" {
  type = string
}


#Availability Set

variable "availability_set_name_workstation" {
  type = string
}

variable "availability_set_name_application" {
  type = string
}

variable "availability_set_name_powerbigateway" {
  type = string
}


#EventHub

variable "event_hub_namespace_name" {
  type = string
}

variable "ase_internal_ip" {
  type = string
}

variable "uniqueresourcesuffix" {
  type = string
}


#Network Security Rule

variable "PaloAlto1" {
  type = string
}

variable "PaloAlto2" {
  type = string
}

variable "KPMG_On-Premise" {
  type = string
}

variable "KPMG_VPN" {
  type = list(string)
}

variable "KGS_Bangalore" {
  type = list(string)
}

variable "KGS_Gurgaon" {
  type = string
}

variable "ASE_PIP" {
 type = list(string)
}

variable "ADX_Mgmt_IP" {
  type = string
}

variable "ADX_HealthMonitor_IP" {
  type = string
}


#Global RDS Group Name

variable "GlobalRDSGroup_name" {
  type = string
}


# Storage Account - Data Lake Storage StorageV2

variable "storage_account_name_data_lake_1" {
  type = string
}

variable "storage_account_name_data_lake_2" {
  type = string
}


# Managed Instance

variable "managedInstanceName" {
  type = string
}

variable "managedInstanceadministratorLogin" {
  type = string
}

variable "managedInstanceadministratorLoginPassword" {
  type = string
}

variable "managedInstanceskuName" {
  type = string
}

variable "managedInstancevCores" {
  type = string
}

variable "managedInstancestorageSizeInGB" {
  type = string
}

variable "managedInstancelicenseType" {
  type = string
}


# Storage Account Container

variable "webappbackup_container_name" {
  type = string
}


#App Services

variable "app_service_name_kipdev" {
  type = string
}

variable "app_service_name_kiprestdev" {
  type = string
}

variable "app_service_name_mep-kipdev" {
  type = string
}

variable "app_service_name_meprest-kipdev" {
  type = string
}

variable "app_service_name_kipqa" {
  type = string
}

variable "app_service_name_kiprestqa" {
  type = string
}

variable "app_service_name_mep-kipqa" {
  type = string
}

variable "app_service_name_meprest-kipqa" {
  type = string
}

variable "app_service_name_dasnp" {
  type = string
}

variable "app_service_name_dasrestnp" {
  type = string
}

variable "functionapp_name_dev" {
  type = string
}

variable "functionapp_name_qa" {
  type = string
}

variable "windows_services_vm_name" {
  type = string
}


# Custom RBAC Variables

variable "RBAC_CustomWebsiteContributor_Name" {
  type = string
}

variable "RBAC_CustomSQLManagedInstanceContributor_Name" {
  type = string
}

variable "RBAC_CustomStorageAccountContributor_Name" {
  type = string
}

variable "RBAC_CustomKeyVaultRead_Name" {
  type = string
}

variable "RBAC_CustomSQLDBContributor_Name" {
  type = string
}


#KME Subnet Access for DataLake

variable "kme_ase_subnet_id" {
  type = string
}

variable "kme_admin_subnet_id" {
  type = string
}

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


#Azure Data Explorer variables

variable "adx_name"{
  type    = string
}

variable "adx_engine_pip_name" {
  type = string
}

variable "adx_data_mgmt_pip_name" {
  type = string
}

variable "adx_min_instance_count"{
  type    = number
  }

variable "adx_max_instance_count"{
  type    = number
  }

  variable "adx_database_name"{
    type = string
  }

  variable "adx_database_cache_period"{
    type    = string
  }

   variable "adx_database_retention_period"{
    type    = string
  }

  variable "kip_adf_contributers"{
    type    = string 
  }

  variable "adx_database_principal_name"{
    type    = string
  }

  variable "ip_rules" {
    type    = string
    default = ""
  }