subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id       = "c79c197f-2835-49dc-846a-06644d7f10c4"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
core_spn_id = ""
core_spn_secret = ""

#secrets
client_secret   = ""
vm_admin_password  = ""

tags = {
  Environment = "Development"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Modern Data Platform (MDP)"

}

application_acronym           = "mdp"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "dv"
environment = "development"

#Network Components
vnet_address_space = ["10.51.64.0/24", "10.51.65.0/24", "10.51.66.0/24", "10.51.68.0/22"]
dns_servers        = ["10.1.11.4", "10.1.11.5"]

#RouteTable
azfwsubscriptionid       = "c72acede-d539-45d9-963d-3464ec4ddae0"
firewall_network_name    = "firewall-primary-dev-core"
firewall_network_rg_name = "CO-dv-eastus-hubvnet-rg"

#VNet Peering
hub_subscription_id          = "c72acede-d539-45d9-963d-3464ec4ddae0"
hub_vnet_name                = "CO-dv-eastus-hub-vnet"
hub_vnet_resource_group_name = "CO-dv-eastus-hubvnet-rg"

transit_subscription_id    = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transit_vnet_resource_group_name = "co-np-eastus-core1-rg"
transit_vnet_name          = "co-np-eastus-core1-vnet"

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

agent_subnet_id    = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"
#DV_CSM_eventhub_authorization_rule_id = "/subscriptions/1b1fa7fd-95a5-482c-a5d9-f130d9f27de6/resourceGroups/CO-NP-DSG-CSM-rg/providers/Microsoft.EventHub/namespaces/loggingDataa3hnlej6n7toq/authorizationRules/RootManageSharedAccessKey" #CSM_EventHub
#build_subnet_id    = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-build-dv"
build_subnet_address_prefix = "10.100.4.0/22"

# Private DNS Zone
private_dns_zone_subscription            = "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
private_dns_zone_resource_group_name     = "rgp-use-core-private-dnszone-dv"
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

spn_name= "spn-devops-57fad7dc"

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
iics_subnet_address_prefix = "10.51.64.0/28"

avscan_subnet_address_prefix = "10.51.64.16/28"
os_disk_size = "127"
/*
domain_name 							 = "kconp.local"
ou_path 									 = "OU=AADDC Computers,DC=kconp,DC=local"
*/
vm_count_buildvm_iics      = 1
vm_size_build              =  "Standard_D8s_v4"
vm_count_buildvm_iics_ts      = 1


# Application Gateway
application_gateway = {
  environment_acronym = "dev"
  subnet_address = "10.51.65.0/27"
  sku = {
	name     = "WAF_V2"
  tier     = "WAF_V2"
  capacity = 2
  }
}

# App Gateway certificate
backend_cer_cert_name             = "kpmgcloudops.com"
aks_cert_name                     = "mdpdev.kpmgcloudops.com"
app_intg_cert_name                = "mdp-dev.kpmgcloudops.com"
api_pfx_cert_name                 = "mdpapi-dev.kpmgcloudops.com"
api_developer_pfx_cert_name       = "mdpapi-dev-developer.kpmgcloudops.com"

#IP Ranges
kpmg_trusted_address_prefixes = ["20.185.109.156/32", "54.173.33.56/32", "199.207.253.0/24", "20.185.106.213/32", "103.58.118.0/24", "199.206.0.5/32", "103.216.201.101/32"]
kpmg_nat_ip_list            = ["199.206.0.0/25","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","103.58.118.81/28","199.247.33.6/28"]

# APIM
apimsku = "Developer_1"
publisher_name = "mdp publisher"
publisher_email = "rakeshkumar4@kpmg.com"
apim_subnet_address_prefix = "10.51.64.192/27"
virtual_network_type = "Internal"
probe_path      = "/status-0123456789abcdef"

spoke_vnet_name = "vnt-use-ase-dv"
spokevnetrgname = "RGP-USE-ASE-DV"

# MDP AKS 
aks_version                 = "1.21.9"
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
      delegation_name            = "Microsoft.Web.serverFarms" 
      service_delegation_name    = "Microsoft.Web/serverFarms"
      service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }]

subnet_service_endpoints_clamav_fap = ["Microsoft.Storage"]
subnet_delegation_clamav_fap        = [{
      delegation_name               = "Microsoft.Web.serverFarms"
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