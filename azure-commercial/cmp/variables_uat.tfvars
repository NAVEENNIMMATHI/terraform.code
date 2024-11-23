#Backend Variables
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
client_secret     = ""
vm_admin_password = ""

#Tags
tags = {
  Environment = "UAT"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Cloud Migration Platform (CMP)"

}

#Environment Variables
application_acronym           = "cmp"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "uat"
target_deployment_environment = "uat"


#Data Sources
spoke_vnet_name    = "vnt-use-ase-uat"
spoke_vnet_rg_name = "RGP-USE-ASE-UAT"
spoke_law_name     = "law-use-sharedras-uat"
spoke_law_rg_name  = "rgp-use-ase-uat"


#Network component
cmp_agw_subnet_address_prefix = "10.50.76.0/28"
vnet_address_space            = ["10.51.112.0/24"]
kpmg_trusted_address_prefixes = ["20.185.109.156/32", "54.173.33.56/32", "199.207.253.0/24", "20.185.106.213/32", "103.58.118.0/24", "199.206.0.5/32", "103.216.201.101/32"]
source_address_prefix = "10.100.0.0/24"
cmp_shared_pep_subnet_address_prefix = "10.50.76.96/28"


#Subnets
#privatelink_subnet_address_prefix  = "10.50.76.32/28"
application_gateway_subnet_address = "10.50.76.0/28"
#client_vm_subnet_address_prefix    = ["10.50.76.16/28" ,"10.50.76.48/28"]
cmp_clients = {
  tenant1 = {
    name            = "tenant1"
    subnet_cidr     = "10.50.76.16/28"
    pep_subnet_cidr = "10.50.76.32/28"
    vm_acronym      = "TE1"
    app_registrations = ["spa" ,"api"]
  }
  /*tenant2 = {
    name            = "tenant2"
    subnet_cidr     = "10.50.76.48/28"
    pep_subnet_cidr = "10.50.76.64/28"
    vm_acronym      = "TE2"
    app_registrations = ["spa" ,"api"]
  }*/
    /*tenant3 = {
    name            = "tenant3"
    subnet_cidr     = "10.50.76.80/28"
    pep_subnet_cidr = "10.50.76.96/28"
    vm_acronym      = "TE3"
    app_registrations = ["spa" ,"api"]
  }*/

}

#Client Virtual Machine
vm_count_cmp_client = 1
vm_size_build         = "Standard_D4s_v3"
clientvm_sku          = "2019-Datacenter"


# Private DNS Zone
private_dns_zone_subscription            = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name     = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"
#private_dns_zone_name_blob               = "privatelink.blob.core.windows.net"
#private_dns_zone_name_dfs                = "privatelink.dfs.core.windows.net"
#private_dns_zone_name_database           = "privatelink.database.windows.net"
#private_dns_zone_name_databricks         = "privatelink.azuredatabricks.net"
#private_dns_zone_name_datafactory        = "privatelink.datafactory.azure.net"
#private_dns_zone_name_automation_agensvc = "privatelink.agentsvc.azure-automation.net"
#private_dns_zone_name_automation         = "privatelink.azure-automation.net"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
#private_dns_zone_name_servicebus         = "privatelink.servicebus.windows.net"
#private_dns_zone_name_synapse            = "privatelink.sql.azuresynapse.net"
#private_dns_zone_name_dev_synapse        = "privatelink.dev.azuresynapse.net"
#private_dns_zone_name_azurewebsites      = "privatelink.azurewebsites.net"
private_dns_zone_name_azurecr            = "privatelink.azurecr.io"
#private_dns_zone_name_azmk8s            =  "privatelink.eastus.azmk8s.io"
private_dns_zone_name_postgres           = "privatelink.postgres.database.azure.com"


# PostgreSql
cmp_aps_sku      = "GP_Gen5_4"
cmp_aps_version  = "11"
cmp_aps_storage  = "102400"
sql_admin_password  = ""

# Application Gateway
application_gateway = {
  environment_acronym = "uat"
  subnet_address = "10.50.76.0/28"
  sku = {
	name     = "WAF_V2"
  tier     = "WAF_V2"
  capacity = 2
  }
}

backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "tenant1.cmpuat.kpmgcloudops.com"

#RouteTable
firewall_primary_core = "10.6.24.4" # Need to ask question 
azfwsubscriptionid       = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
firewall_network_name    = "fwl-use-primary-uat-core"
firewall_network_rg_name = "RGP-USE-COREVNET-UAT"

#App Registrations
spa_redirect_url    = "https://tenant1.cmpuat.kpmgcloudops.com/"
tenant_fqdn = "kpmgusadvcloudops.onmicrosoft.com"