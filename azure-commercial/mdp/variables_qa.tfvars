subscription_id = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
client_id       = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
core_spn_id = ""
core_spn_secret = ""

#secrets
client_secret   = ""
vm_admin_password  = ""

tags = {
  Environment = "QA"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Modern Data Platform (MDP)"
}

application_acronym           = "mdp"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "qa"
environment = "qa"


#Network Components
vnet_address_space = ["10.71.64.0/24", "10.71.65.0/24", "10.71.66.0/24", "10.71.68.0/22"]
dns_servers        = ["10.1.11.4", "10.1.11.5"]

#RouteTable
azfwsubscriptionid       = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
firewall_network_name    = "fwl-use-primary-qa-core"
firewall_network_rg_name = "RGP-USE-COREVNET-QA"

#VNet Peering
hub_subscription_id          = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
hub_vnet_name                = "vnt-use-core-qa"
hub_vnet_resource_group_name = "RGP-USE-COREVNET-QA"

transit_subscription_id    = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transit_vnet_resource_group_name = "co-np-eastus-core1-rg"
transit_vnet_name          = "co-np-eastus-core1-vnet"

databricks = {
  workspace = {
    sku = "premium"
  }
  subnets = {
    private = {
      address_prefix = "10.71.64.64/26"
    }
    public = {
      address_prefix = "10.71.64.128/26"
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

privatelink_subnet_address_prefix = "10.71.66.0/24"
adf_subnet_address_prefix         = "10.71.64.16/28"

func_subnet_address_prefix         = "10.71.64.224/27"

agent_subnet_id    = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"
build_subnet_address_prefix = "10.101.12.0/22"

# Private DNS Zone
private_dns_zone_subscription            = "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
private_dns_zone_resource_group_name     = "RGP-USE-CORE-PRIVATE-DNSZONE-DV"
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

spn_name= "spn-devops-96e9a7e6"

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

encryptapp_sp_name         = "spn-devops-3507153c"
iics_subnet_address_prefix = "10.71.64.0/28"

avscan_subnet_address_prefix = "10.71.64.16/28"
/*
domain_name 							 = "kconp.local"
ou_path 									 = "OU=AADDC Computers,DC=kconp,DC=local"
*/
vm_count_buildvm_iics      = 1
vm_size_build              = "Standard_D8s_v4"
vm_count_buildvm_iics_ts   = 1
os_disk_size               = "127"

# Application Gateway
application_gateway = {
  environment_acronym = "qa"
  subnet_address = "10.71.65.0/27"
  sku = {
	name     = "WAF_V2"
  tier     = "WAF_V2"
  capacity = 2
  }
}

# App Gateway certificate
backend_cer_cert_name                = "kpmgcloudops.com"
aks_cert_name                        = "mdpqa.kpmgcloudops.com"
app_intg_cert_name                   = "mdp-qa.kpmgcloudops.com"
api_pfx_cert_name                    = "mdpapi-qa.kpmgcloudops.com"
api_developer_pfx_cert_name          = "mdpapi-qa-developer.kpmgcloudops.com"

#IP Ranges
kpmg_trusted_address_prefixes = ["20.185.109.156/32", "54.173.33.56/32", "199.207.253.0/24", "20.185.106.213/32", "103.58.118.0/24", "199.206.0.5/32", "103.216.201.101/32"]
kpmg_nat_ip_list            = ["199.206.0.0/25","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28","199.247.33.6/28"]

# APIM
apimsku                    = "Developer_1"
publisher_name             = "mdp publisher"
publisher_email            = "rakeshkumar4@kpmg.com"
apim_subnet_address_prefix = "10.71.64.192/27"
virtual_network_type       = "Internal"
probe_path                 = "/status-0123456789abcdef"

spoke_vnet_name = "vnt-use-ase-qa"
spokevnetrgname = "RGP-USE-ASE-qa"

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
subnet_address_space_aks    = "10.71.68.0/22"

# Subnet address space for vnet integration
clamav_fap_subnet_address_prefix  = "10.71.65.64/27"
clamav_wap_subnet_address_prefix  = "10.71.65.32/27"
app_intg_subnet_address_prefix    = "10.71.65.192/26"

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
DNS_VNET = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet"


#Clamav Configuration

clamav_eventgrid_function_name = "EventGridTrigger"
clamav_storage_account_function_name = "BlobTrigger"
fun_main_version = "~1"