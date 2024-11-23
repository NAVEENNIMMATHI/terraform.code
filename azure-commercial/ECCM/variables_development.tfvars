#Auth Variables

tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id       = "c79c197f-2835-49dc-846a-06644d7f10c4"
client_secret   = ""

#dministrator_login          = "kpmgfotdaadmin"
#administrator_login_password = ""

# Tags

tags = {
  Platform        = "Azure Commercial Cloud"
  Environment     = "Development"
  Node            = "Spoke"
  Solution        = "Ethics and Compliance Case Management (ECCM)"
  LOB             = "Consulting"
  BusinessContact = "jleamon@kpmg.com"
  BusinessOwner   = "Jeffrey Leamon"
}

#Environment Variables
application_acronym           = "eccm"
location_acronym              = "use"
resource_location             = "eastus"
environment                   = "development"
environment_acronym           = "dv"
application_name              = "eccm-app"

#Service Principle
devopsspn_service_principal_name = "spn-devops-57fad7dc"
dev_spn = "6b431e8b-4691-49a5-aaaa-47ab8f001bc1"

#Virtual Network 
spoke_vnet_name= "vnt-use-ase-dv"
spoke_vnet_rg_name = "RGP-USE-ASE-DV"

#Subnet Variables
eccm_agw_subnet_address_prefix     = "10.50.16.0/25"
eccm_lap_pvt_subnet_address_prefix = "10.50.16.128/25"
eccm_lap_pub_subnet_address_prefix = "10.50.17.0/25"
eccm_aks_subnet_address_prefix     = "10.50.18.0/25"
eccm_pep_subnet_address_prefix     = "10.50.17.128/25"
eccm_css_subnet_address_prefix     = "10.50.18.128/25"
eccm_app_subnet_address_prefix     = "10.50.19.0/25"

#Route Table Variables
AzureFirewallIPAddress = "10.6.24.4"

#KMPG trusted IP range
kpmg_trusted_ip = ["20.185.109.156/32","103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","20.185.106.213/32","199.206.0.5/32","103.58.118.0/24"]

#Secrets


# AKS cluster
aks_version                = "1.25"
aks_default_node_pool_name = "agentpool"
aks_default_node_count     = "1"
aks_default_node_size      = "Standard_D8s_v3" 
aks_default_auto_scaling   = "false"
aks_default_pool_type      = "VirtualMachineScaleSets"
aks_default_avail_zones    = ["1"]
dns_vnet                   = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet"
aks_lin_node_pool_name     = "eccmpool"
aks_lin_node_count         = "0"
aks_lin_node_size          = "Standard_DS2_v2"
aks_lin_auto_scaling       = "false"
aks_lin_avail_zones        = ["1"]
aks_node_subscription      = "dev-spoke-application"


# Private DNS Zone
private_dns_zone_subscription            = "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
private_dns_zone_resource_group_name     = "rgp-use-core-private-dnszone-dv"
private_dns_zone_name_logic_app          = "privatelink.azurewebsites.net"   
private_dns_zone_name_blob               = "privatelink.blob.core.windows.net" 
private_dns_zone_name_table              = "privatelink.table.core.windows.net" 
private_dns_zone_name_queue              = "privatelink.queue.core.windows.net" 
private_dns_zone_name_logic_app_storage  = "privatelink.web.core.windows.net"
private_dns_zone_name_sql                = "privatelink.database.windows.net"
private_dns_zone_name_acr                = "privatelink.azurecr.io"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"

# Application Gateway
application_gateway = {
  sku = {
	name     = "WAF_v2"
  tier     = "WAF_v2"
  capacity = 2
  }
}

backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "eccmservice-dv.kpmgcloudops.com"