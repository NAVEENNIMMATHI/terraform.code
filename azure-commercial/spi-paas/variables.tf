#environment specific variables

variable "environment" {
  type    = string
  default = ""
}

variable "location_acronym" {
  type    = string
  default = ""

}
variable "location_acronym_uk" {
  type    = string
  default = ""

}

variable "environment_acronym" {
  type    = string
  default = ""

}
variable "Storage_environment_acronym" {
  type    = string
  default = ""
}
variable "app_url_acronym" {
  type    = string
  default = ""

}
variable "application_name" {
  type    = string
  default = ""
}

variable "location" {
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
variable "application_type" {
  type    = string
  default = ""
}
variable "client_id" {
  type    = string
  default = ""

}

variable "rest_app_id"{
  type    = string
}

variable "client_secret" {
  type    = string
  default = ""

}
variable "subscription_id" {
  type    = string
  default = ""

}

variable "os_letter"{
  type    = string
  default = ""
}
variable "tenant_id" {
  type    = string
  default = ""

}
variable "environment_acronym_agw" {
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

variable "app_gateway_environment_acronym" {
  type    = string
  default = ""
}
variable "appgateway_sku"{
  type    = string
  default = ""
}

variable "spipaasctrapp"{
  type    = string
  default = ""
}

variable "spipaasrestctrapp"{
  type    = string
  default = ""
}

variable "spipaasctrsslcertpfx"{
  type    = string
  default = ""
}

variable "spipaasrestctrsslcertpfx"{
  type    = string
  default = ""
}

variable "AppGatewaycertpassword"{
   type    = string
   default = ""
}

variable "selfsigncertname"{
   type    = string
   default = ""
}
variable "spipaaswebappsslcert"{
   type    = string
   default = ""
}
variable "spipaasrestsslcert"{
   type    = string
   default = ""
}

variable "azfirewall_ip_address"{
  type    = string
   default = ""
}

variable "AZFW_PIP" {
   type = list(string)
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

variable "webappbackup_container_name"{
   type    = string
   default = ""
}

variable "sqlserveradmin_password" {
  type    = string
  default = ""
}

variable "encryptapp_service_principal_name"{
  type    = string
  default = ""
}

variable "backupmanagement_service_principal_name"{
   type    = string
   default = ""
}

#virtual_network
variable "spipaasvnet_address_space_ctr"{
  type = list(string)
}

variable "dns_server" {
  type = list(string)
}

variable "subnet_address_space_ctrappgw" {
  type    = string
  default = ""
}

variable "subnet_address_space_ctrapp1" {
  type    = string
  default = ""
}
variable "subnet_address_space_ctrwst1" {
  type    = string
  default = ""
}
variable "subnet_address_space_ctrpe1" {
  type    = string
  default = ""
}
variable "subnet_address_space_ctrdb1" {
  type    = string
  default = ""
}
variable "subnet_address_space_ctradf1"{
  type    = string
  default = ""
}
variable "subnet_address_space_webapp1" {
  type    = string
  default = ""
}
variable "subnet_address_space_restapp1" {
  type    = string
  default = ""
}
variable "cloudops_keyvault_admin_group_name"{
  type    = string
  default = ""
}

variable "client_keyvault_admin_group_name" {
  type    = string
  default = ""
}
variable "application_region" {
  type    = string
  default = ""
}
variable "coresubscriptionid" { type = string }


variable "newcoresubscriptionid" { type = string }

variable "corevnetresourcegroup" { type = string }

variable "newcorevnetresourcegroup" { type = string }

variable "corevnetname" { type = string }

variable "newcorevnetname" { type = string }

variable "coreinfrasubnetid" {
  type    = string
  default = ""
}

variable "core_aks_subnet_id" {
  type    = string
  default = ""
}

#SPI APP subnet
variable "spiappsubnetname" {
  type    = string
  default = ""
}
variable "spiappvnetname" {
  type    = string
  default = ""
}
variable "spivnetresourcegroup" {
  type    = string
  default = ""
}

variable "spipaas_fqdn"{
  type = list(string)
}

variable "spipaasrest_fqdn"{
 type = list(string)
}

variable "count_value_spipaascentral"{
  type    = string
  default = ""
}
variable "count_value_spipaaspbi"{
  type    = string
  default = ""
}
variable "count_value_spipaaspbi_uk"{
  type    = string
  default = ""
}
variable "count_value_spipaasukwst"{
  type    = string
  default = ""
}
variable "vm_size_spipaaswst"{
  type    = string
  default = ""
}
variable "vm_size_pbi"{
  type    = string
  default = ""
}
variable "vm_admin_password"{
   type    = string
   default = ""
}
variable "data_disk_size_spipaaswst"{
   type    = string
   default = ""
}
variable "data_disk_size_spipaaspbi"{
   type    = string
   default = ""
}

variable "corepvtdnsresourcegroup"{
  type    = string
  default = ""
}

variable "KPMG_On-Premise" {
  type    = string
  default = ""
}
variable "KIP_ASE_PIP"{
  type    = string
}

variable "KPMG_VPN_US" {
  type = list(string)
}
variable "KPMG_VPN_UK" {
  type = list(string)
}
variable "KPMG_VPN_CN" {
  type = list(string)
}
variable "KPMG_VPN_BR" {
  type = list(string)
}
variable "KPMG_VPN_AU" {
  type = list(string)
}
variable "KGS_Bangalore" {
  type = list(string)
}
variable "agw1_subnet_adress_space_central"{
   type    = string
   default = ""
}
variable "agw1_subnet_adress_space_us"{
   type    = string
   default = ""
}

#US Region specific
variable "application_region1"{
  type    = string
  default = "us"
}
variable "pip_count"{
   type    = string
   default = ""
}

variable "ipv4_firewall_rules" {
  type = list(map(string))
  default = []
}
variable "tenantfqdn"{
  type    = string
  default = ""
}
variable "analysis_services_admins_groupname" {
  type    = string
  default = ""
}

variable "pvt_dns_environment_acronym" {
  type    = string
  default = ""
}

variable "pvt_dns_subscription_id" {
  type    = string
  default = ""
}
variable "pvt_dns_resource_group" {
  type    = string
  default = ""
}

# region application variables 

variable "application_rg" {
  type = map
}
variable "appservice_plan" {
  type = map
}
variable "appservice" {
  type = map
}
variable "storage_account_logs" {
  type = map
}
variable "storage_account_data" {
  type = map
}
variable "storage_account_vmlogs"  {
  type = map
}
variable "storage_account_functionapp" {
  type = map
}
variable "key_vault" {
  type = map
}
variable "loganalytics_workspace" {
  type = map
}
variable "sql_server_prod" {
  type = map(object({
    region     = string
    location     =  string
    location_acronym = string
  }))
}
variable "sql_server_stage" {
  type = map(object({
    region     = string
    location     =  string
    location_acronym = string
  }))
}
variable "sql_server_app" {
  type = map(object({
    region     = string
    location     =  string
    location_acronym = string
}))
}
variable "sql_server_prod_elp" {
  type = map(object({
    region     = string
    location     =  string
    location_acronym = string
    sql_elastic_pool_max_size = string
    sqlelasticpool_sku_name = string
    sqlelasticpool_sku_tier = string
    sqlelasticpool_sku_family = string
    sqlelasticpool_sku_capacity = string
    sqlelasticpool_min_capacity = string
    sqlelasticpool_max_capacity = string
  }))
}
variable "sql_server_stage_elp" {
  type = map(object({
    region     = string
    location     =  string
    location_acronym = string
    sql_elastic_pool_max_size = string
    sqlelasticpool_sku_name = string
    sqlelasticpool_sku_tier = string
    sqlelasticpool_sku_family = string
    sqlelasticpool_sku_capacity = string
    sqlelasticpool_min_capacity = string
    sqlelasticpool_max_capacity = string
  }))
}
variable "sql_server_app_elp" {
  type = map(object({
    region     = string
    location     =  string
    location_acronym = string
    sql_elastic_pool_max_size = string
    sqlelasticpool_sku_name = string
    sqlelasticpool_sku_tier = string
    sqlelasticpool_sku_family = string
    sqlelasticpool_sku_capacity = string
    sqlelasticpool_min_capacity = string
    sqlelasticpool_max_capacity = string
  }))
}
variable "network_security_group"{
  type = map
}
variable "application_vnet" {
  type = map
}
variable "agw_subnet" {
  type     = map
}
variable "wst_subnet" {
  type     = map
}
variable "db_subnet" {
  type     = map
}
variable "pep_subnet" {
  type     = map
}
variable "ssis_subnet" {
  type     = map
}
variable "pbi_subnet" {
  type     = map
}
variable "appsrv_subnet" {
  type     = map
}
variable "vnetint_subnet" {
  type     = map
}
variable "public_ip"{
  type = map
}
variable "analysisservice"{
   type = map
}
variable "application_gateway"{
   type = map
}

variable "uk" {
    default = {
        "VM1" = {
            "vm_workload_desc" = "DG1"
        },
        "VM2" = {
            "vm_workload_desc" = "DG2"
        }
    }
}

variable "enable_accelerated_networking" {
  type    = bool
  default = false
}
variable "wstn_vm"{
   type = map
  
}
variable "pbi_vm"{
   type = map
 
}
variable "publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}

variable "offer" {
  type    = string
  default = "WindowsServer"
}

variable "sku" {
  type    = string
  default = "2019-Datacenter"
}
variable "vmimageversion" {
  type    = string
  default = "latest"
}
variable "azurerm_image_id" {
  type = string
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
variable "auto_upgrade_minor_version" {
  type    = bool
  default = false
}
variable "vm_location" {
  type    = string
}