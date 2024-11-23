#Backend Variables

subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
core_spn_id = ""
core_spn_secret = ""

#secrets
client_secret   = ""
vm_admin_password  = ""

tags = {
  Environment = "UAT"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Modern Data Platform (MDP)"

}

application_acronym       = "mdp"
location_acronym          = "use"
location                  = "eastus"
environment_acronym       = "uat"
environment               = "uat"


#Network Components
vnet_address_space = ["10.51.64.0/24", "10.51.65.0/24", "10.51.66.0/24", "10.51.68.0/22"]
dns_servers        = ["10.30.15.196","10.30.15.197"]

#RouteTable
azfwsubscriptionid       = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
firewall_network_name    = "fwl-use-primary-uat-core"
firewall_network_rg_name = "RGP-USE-COREVNET-UAT"

#VNet Peering
hub_subscription_id          = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
hub_vnet_name                = "vnt-use-core-uat"
hub_vnet_resource_group_name = "RGP-USE-COREVNET-UAT"

transit_subscription_id    = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transit_vnet_resource_group_name = "CO-P-eastus-hubvnet-rg"
transit_vnet_name          = "CO-P-eastus-hub-vnet"

databricks = {
  workspace = {
    sku = "premium"
  }
  subnets = {
    private = {
      address_prefix = "10.51.64.64/26"
    }
    public = {
      address_prefix = "10.51.64.128/26"
    }
  }
}

## Data Lake
mdp_adls_main = {
  account_tier     = "Standard"
  replication_type = "RAGRS"
  containers = [
    "Raw",
    "Clean",
    "Process",
    "Trusted"
  ]
}
account_tier     = "Standard"
replication_type = "RAGRS"

privatelink_subnet_address_prefix = "10.51.66.0/24"
adf_subnet_address_prefix         = "10.51.64.16/28"

func_subnet_address_prefix         = "10.51.64.224/27"

agent_subnet_id    = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
wvd_subnet_id      = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-rdgw-uat"
core_aks_subnet_id = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"
build_subnet_address_prefix = "10.100.20.0/22"

# Private DNS Zone
private_dns_zone_subscription            = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name     = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"
private_dns_zone_name_blob               = "privatelink.blob.core.windows.net"
private_dns_zone_name_queue              = "privatelink.queue.core.windows.net"
private_dns_zone_name_dfs                = "privatelink.dfs.core.windows.net"
private_dns_zone_name_database           = "privatelink.database.windows.net"
private_dns_zone_name_databricks         = "privatelink.azuredatabricks.net"
private_dns_zone_name_datafactory        = "privatelink.datafactory.azure.net"
private_dns_zone_name_automation_agensvc = "privatelink.agentsvc.azure-automation.net"
private_dns_zone_name_automation         = "privatelink.azure-automation.net"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
private_dns_zone_name_servicebus         = "privatelink.servicebus.windows.net"
private_dns_zone_name_synapse            = "privatelink.sql.azuresynapse.net"
private_dns_zone_name_dev_synapse        = "privatelink.dev.azuresynapse.net"
private_dns_zone_name_azurewebsites      = "privatelink.azurewebsites.net"
private_dns_zone_name_azurecr            = "privatelink.azurecr.io"
private_dns_zone_name_azmk8s            =  "privatelink.eastus.azmk8s.io"

spn_name= "spn-devops-104a6d25"

/* remove those value
node_size = "Standard_D2_v3"
number_of_nodes = "1"
max_parallel_executions_per_node = "1"
edition = "Standard"
license_type = "BasePrice"
*/
mdp_sql_admin_login_password = ""
sypnase_analyticsdev1_performance_level    = "DW1000c"
app_service_plan_size = "P1v2"
app_service_plan_tier = "PremiumV2"

#Virtual Machine

encryptapp_sp_name         = "spn-devops-104a6d25"
iics_subnet_address_prefix = "10.51.64.0/28"

avscan_subnet_address_prefix = "10.51.64.16/28"
/*
domain_name 							 = "kconp.local"
ou_path 									 = "OU=AADDC Computers,DC=kconp,DC=local"
*/
vm_count_buildvm_iics      = 1
vm_count_buildvm_iics_ts   = 0
vm_size_build              = "Standard_D8s_v4"
os_disk_size               = "127"


# Application Gateway
application_gateway = {
  environment_acronym = "uat"
  subnet_address = "10.51.65.0/27"
  sku = {
	name     = "WAF_V2"
  tier     = "WAF_V2"
  capacity = 2
  }
}

# App Gateway certificate
backend_cer_cert_name                = "kpmgcloudops.com"
aks_cert_name                        = "mdpuat.kpmgcloudops.com"
app_intg_cert_name                   = "mdp-uat.kpmgcloudops.com"
api_pfx_cert_name                    = "mdpapi-uat.kpmgcloudops.com"
api_developer_pfx_cert_name          = "mdpapi-uat-developer.kpmgcloudops.com"

#IP Ranges
kpmg_trusted_address_prefixes = ["20.185.109.156/32", "54.173.33.56/32", "199.207.253.0/24", "20.185.106.213/32", "103.58.118.0/24", "199.206.0.5/32", "103.216.201.101/32"]
kpmg_nat_ip_list            = ["199.206.0.0/25","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28","199.247.33.6/28"]

# APIM
apimsku                    = "Developer_1"
publisher_name             = "mdp publisher"
publisher_email            = "go-fmmanagedservices@kpmg.com"
apim_subnet_address_prefix = "10.51.64.192/27"
virtual_network_type       = "Internal"
probe_path                 = "/status-0123456789abcdef"

spoke_vnet_name = "vnt-use-ase-uat" #Is this necessary -- Inform Pritu if it is
spokevnetrgname = "RGP-USE-ASE-UAT"

# MDP AKS 
aks_version                 = "1.22.6"
aks_default_node_pool_name  = "agentpool"
aks_default_node_count      = "4"
aks_default_node_size       = "Standard_D8s_v3"
aks_default_auto_scaling    = "false"
aks_default_pool_type       = "VirtualMachineScaleSets"
aks_default_avail_zones     = ["1"]

aks_win_node_pool_name      = "wnpool"
aks_win_node_count          = "4"
aks_win_node_size           = "Standard_DS2_v2"
aks_win_auto_scaling        = "false"
aks_win_avail_zones         = ["1"]

aks_pgs_sku                 = "GP_Gen5_4"
aks_pgs_version             = "11"
aks_pgs_storage             = "640000"
subnet_address_space_aks    = "10.51.68.0/22"

# Subnet address space for vnet integration
clamav_fap_subnet_address_prefix  = "10.51.65.64/27"
clamav_wap_subnet_address_prefix  = "10.51.65.32/27"
app_intg_subnet_address_prefix    = "10.51.65.192/26"

subnet_service_endpoints_clamav_wap = ["Microsoft.Storage"]
subnet_delegation_clamav_wap = [{
      delegation_name            = "clamav_web_delegation"
      service_delegation_name    = "Microsoft.Web/serverFarms"
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }]

subnet_service_endpoints_clamav_fap = ["Microsoft.Storage"]
subnet_delegation_clamav_fap        = [{
      delegation_name               = "clamav_func_delegation"
      service_delegation_name       = "Microsoft.Web/serverFarms"
      service_delegation_actions    = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }]

database_clamav_net_prefixes = ["104.16.218.84", "104.16.219.84"]

# dns_vnet 
DNS_VNET = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"

#Clamav Configuration
clamav_eventgrid_function_name = "EventGridTrigger"
clamav_storage_account_function_name = "BlobTrigger"
fun_main_version = "~4"