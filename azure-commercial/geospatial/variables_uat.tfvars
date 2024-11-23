# Authentication
client_id       = "9975dc86-7489-483c-b49c-47bdff5e2eb8"
client_secret   = ""
subscription_id = "b75fc3c3-04a4-45a6-b126-8279f505e873"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Environment Variables
location                = "eastus"
location_acronym        = "use"
environment             = "uat"
environment_acronym     = "uat"
application_acronym     = "arcgis"
separator				        = "-"

tags = {
  Environment     = "uat"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Geospatial Platform"
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
}

#Virtual Network Address Space
vnet_address_space                       =["10.51.80.0/20"]
dns_servers 								           	 =["10.30.15.197" , "10.30.15.196"]
#Subnets
geospatial_aks_subnet_address_prefix     = "10.51.88.0/23"
geospatial_agw_subnet_address_prefix     = "10.51.84.0/28"
geospatial_pep_subnet_address_prefix     = "10.51.85.0/24"
geospatial_vm_subnet_address_prefix      = "10.51.86.0/27"
geospatial_pstflex_subnet_address_prefix = "10.51.81.0/28"
geospatial_mgmt_subnet_address_prefix    = "10.51.82.0/27"

#VNet Peering
hub_subscription_id          = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
hub_vnet_name                = "vnt-use-core-uat"
hub_vnet_resource_group_name = "RGP-USE-COREVNET-UAT"

transit_subscription_id          = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transit_vnet_resource_group_name = "CO-P-eastus-hubvnet-rg"
transit_vnet_name                = "CO-P-eastus-hub-vnet"

#IP Ranges
kpmg_trusted_address_prefixes = ["20.185.106.126/32","20.185.110.197/32","199.207.253.0/24","199.206.0.5/32","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","13.90.131.217","52.170.175.39","52.170.174.246","52.188.26.32","52.188.27.2","52.188.26.99","104.211.19.220/32","52.152.148.131/32","40.87.108.64","52.224.146.56","137.116.81.189","52.249.253.174"]
kpmg_nat_ip_list              = ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]

#StorageAccount
agent_subnet_id                          = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"
wvd_subnet_id                            = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-rdgw-uat"
core_aks_subnet_id                       = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-core-aks-uat"

# Private DNS Zone
private_dns_zone_subscription            = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name     = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"
private_dns_zone_name_file               = "privatelink.file.core.windows.net"
private_dns_zone_name_queue              = "privatelink.queue.core.windows.net"
private_dns_zone_name_dfs                = "privatelink.dfs.core.windows.net"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
private_dns_zone_name_acr                = "privatelink.azurecr.io"
private_dns_zone_name_database           = "privatelink.database.windows.net"
private_dns_zone_name_psql               = "privatelink.postgres.database.azure.com"

#RouteTable
azfwsubscriptionid       = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
firewall_network_name    = "fwl-use-primary-uat-core"
firewall_network_rg_name = "RGP-USE-COREVNET-UAT"

#Data Sources
pbi_subnet_name       = "sub-use-pbi-ut"
spoke_vnet_name 	    = "vnet-use-shared-daut"
spoke_vnet_rg_name 		= "RGP-USE-SHARED-DA-UT"
spoke_law_name        = "law-use-da-shared-ut"
spoke_law_rg_name     = "rgp-use-shared-da-ut"

# Application Gateway
application_gateway = {
  environment_acronym = "ut"
  subnet_address = "10.51.84.0/28"
  sku = {
	name     = "WAF_v2"
  tier     = "WAF_v2"
  capacity = 2
  }
}

# App Gateway certificate
backend_cer_cert_name             = "kpmgcloudops.com"
aks_cert_name                     = "gisut.kpmgcloudops.com"
backend_address_pool_ips          =["10.51.89.249"]

# dns_vnet 
DNS_VNET = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
DNS_VNET_CORE = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat"

# ArcGis AKS 
kubernetes_version                   = "1.23.12"
aks_node_pool_name                   = "arcgispool"
aks_node_count                       = "4"
aks_node_size                        = "Standard_D8s_v3"
enable_auto_scaling                  = "true"
default_node_pool_type               = "VirtualMachineScaleSets"
availability_zones                   = ["1"]
identity_type                        = "SystemAssigned"
min_count                            = 4
max_count                            = 6
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