# Authentication
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret   = ""
subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Environment Variables
location              = "eastus"
location_acronym      = "use"
environment           = "production"
environment_acronym   = "pd"
application_acronym   = "arcgis"
separator				      = "-"

tags = {
  Environment     = "Production"
  LOB             = "Deal Advisory & Strategy"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Geospatial Platform"
  BusinessContact = "tschenk@kpmg.com"
  BusinessOwner   = "Tom Schenk"
}

#Virtual Network Address Space
vnet_address_space       =["10.71.80.0/20"]
dns_servers 					   =["10.30.15.196","10.30.15.197"]

#Subnets
geospatial_aks_subnet_address_prefix     = "10.71.88.0/23"
geospatial_agw_subnet_address_prefix     = "10.71.84.0/28"
geospatial_pep_subnet_address_prefix     = "10.71.85.0/24"
geospatial_vm_subnet_address_prefix      = "10.71.86.0/27"
geospatial_pstflex_subnet_address_prefix = "10.71.81.0/28"
geospatial_mgmt_subnet_address_prefix    = "10.71.82.0/27"

#VNet Peering
hub_subscription_id          = "4c9dc048-01dc-4854-9063-8a3d4060993a"
hub_vnet_name                = "CO-P-eastus-hub-vnet"
hub_vnet_resource_group_name = "CO-P-eastus-hubvnet-rg"

transit_subscription_id          = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
transit_vnet_resource_group_name = "CO-P-eastus-transitvnet-rg"
transit_vnet_name                = "CO-P-eastus-transit-vnet"

#StorageAccount
agent_subnet_id      = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
wvd_subnet_id        = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-rdgw-subnet"
core_aks_subnet_id   = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"

#IP Ranges
kpmg_trusted_address_prefixes = ["20.185.106.126/32","20.185.110.197/32","199.207.253.0/24","199.206.0.5/32","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28","104.211.19.220/32","52.152.148.131/32","52.224.25.180","52.224.25.158","52.224.25.140","20.42.39.126","52.224.25.167","52.224.146.56","137.116.81.189","52.249.253.174"]
kpmg_nat_ip_list              = ["199.207.253.101/30","199.206.0.5/30","103.133.112.80/28","103.58.118.80/28","103.216.201.96/28"]

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
azfwsubscriptionid       = "4c9dc048-01dc-4854-9063-8a3d4060993a"
firewall_network_name    = "firewall-primary-prod-hub"
firewall_network_rg_name = "CO-P-eastus-hubvnet-rg"

#Data Sources
pbi_subnet_name      = "sub-use-pbi-pd"
spoke_vnet_name      = "vnet-use-shared-dapd"
spoke_vnet_rg_name 	 = "RGP-USE-SHARED-DA-PD"
spoke_law_name       = "law-use-da-shared-pd"
spoke_law_rg_name    = "rgp-use-shared-da-pd"

# Application Gateway
application_gateway = {
  environment_acronym = ""
  subnet_address = "10.71.84.0/28"
  sku = {
	  name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }
}

# App Gateway certificate
backend_cer_cert_name             = "kpmgcloudops.com"
aks_cert_name                     = "gis.kpmgcloudops.com"
backend_address_pool_ips          =["10.71.89.249"]

# dns_vnet 
DNS_VNET = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
DNS_VNET_CORE = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"

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
gis_postgresql_sku_name			    = "GP_Standard_D2s_v3"
gis_postgresql_storage_mb		    = "2097152"
gis_postgresql_adminname		    = "kpmggisadmin"
gis_postgrefs_adminpassword     = ""
gis_postgresql_PostGresVersion	= "13"