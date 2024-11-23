# Authentication
client_id       = "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
client_secret   = ""
subscription_id = "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Environment Variables
location                = "eastus"
location_acronym        = "use"
environment             = "qa"
environment_acronym     = "qa"
application_acronym     = "arcgis"
separator				= "-"

tags = {
  Environment     = "qa"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Geospatial Platform"
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
}

#Virtual Network Address Space
vnet_address_space                       =["10.71.80.0/20"]
dns_servers 							 =["10.1.11.4","10.1.11.5","10.101.2.196"]
#Subnets
geospatial_aks_subnet_address_prefix     = "10.71.88.0/23"
geospatial_agw_subnet_address_prefix     = "10.71.84.0/28"
geospatial_pep_subnet_address_prefix     = "10.71.85.0/24"
geospatial_vm_subnet_address_prefix      = "10.71.86.0/27"
geospatial_pstflex_subnet_address_prefix = "10.71.81.0/28"
geospatial_mgmt_subnet_address_prefix    = "10.71.82.0/27"

#VNet Peering
hub_subscription_id          = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
hub_vnet_name                = "vnt-use-core-qa"
hub_vnet_resource_group_name = "RGP-USE-COREVNET-QA"

transit_subscription_id          = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transit_vnet_resource_group_name = "co-np-eastus-core1-rg"
transit_vnet_name                = "co-np-eastus-core1-vnet"

#StorageAccount
agent_subnet_id                          = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"
wvd_subnet_id                            = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
core_aks_subnet_id                       = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-core-aks-qa"

#IP Ranges
kpmg_trusted_address_prefixes = ["20.185.109.156/32","20.185.106.213/32","199.207.253.0/24","199.206.0.5/32","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","40.76.169.86","40.76.168.231","40.76.169.36","40.76.169.44","40.76.169.103","13.82.1.202/32","52.147.199.75/32","172.174.7.135","52.224.146.56","137.116.81.189","52.249.253.174"]
kpmg_nat_ip_list              = ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]

# Private DNS Zone
private_dns_zone_subscription            = "c72acede-d539-45d9-963d-3464ec4ddae0" # dev-core
private_dns_zone_resource_group_name     = "rgp-use-core-private-dnszone-dv"
private_dns_zone_name_file               = "privatelink.file.core.windows.net"
private_dns_zone_name_queue              = "privatelink.queue.core.windows.net"
private_dns_zone_name_dfs                = "privatelink.dfs.core.windows.net"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
private_dns_zone_name_acr                = "privatelink.azurecr.io"
private_dns_zone_name_database           = "privatelink.database.windows.net"
private_dns_zone_name_psql               = "privatelink.postgres.database.azure.com"

#RouteTable
azfwsubscriptionid       = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
firewall_network_name    = "fwl-use-primary-qa-core"
firewall_network_rg_name = "RGP-USE-COREVNET-QA"

#Data Sources
pbi_subnet_name      = "sub-use-pbi-qa"
spoke_vnet_name 		 = "vnet-use-shared-daqa"
spoke_vnet_rg_name 	 = "RGP-USE-SHARED-DA-QA"
spoke_law_name       = "law-use-da-shared-qa"
spoke_law_rg_name    = "RGP-USE-SHARED-DA-QA"

# Application Gateway
application_gateway = {
  environment_acronym = "qa"
  subnet_address = "10.71.84.0/28"
  sku = {
	name     = "WAF_v2"
  tier     = "WAF_v2"
  capacity = 2
  }
}

# App Gateway certificate
backend_cer_cert_name             = "kpmgcloudops.com"
aks_cert_name                     = "gisqa.kpmgcloudops.com"
backend_address_pool_ips          =["10.71.89.249"]

# dns_vnet 
DNS_VNET      = "/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet"
DNS_VNET_CORE = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa"

# ArcGis AKS 
kubernetes_version                   = "1.23.12"
aks_node_pool_name                   = "arcgispool"
aks_node_count                       = "4"
aks_node_size                        = "Standard_D8s_v3"
enable_auto_scaling                  = "true"
default_node_pool_type               = "VirtualMachineScaleSets"
availability_zones                   = ["1"]
identity_type                        = "SystemAssigned"
min_count                            = 2
max_count                            = 5
network_profile_outbound_type        = "userDefinedRouting"

#Virtual Machine
vm_size_build                        = "Standard_D8s_v4"
data_disk_size_arcgis                = "256"
vm_count_buildvm_ts                  = 1
arcgis_vm_admin_password             = ""
client_vm_sku                        = "2019-Datacenter"
managed_disk_type                    = "Standard_LRS"

#PostgresSql Database variables
gis_postgresql_sku_name							 = "GP_Standard_D2s_v3"
gis_postgresql_storage_mb				     = "2097152"
gis_postgresql_adminname						 = "kpmggisadmin"
gis_postgrefs_adminpassword          = ""
gis_postgresql_PostGresVersion			 = "13"
