#Backend Variables
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret   = ""

#Tags
tags = {
	Environment     = "Production"
	LOB	        	= "Consulting"
	Node            = "Spoke"
	Platform        = "Azure Commercial Cloud"
	Solution        = "Ignite"
	BusinessContact = "tgunarathne@kpmg.com"
	BusinessOwner   = "Thilina Gunarathne"
	Datadog        =  "Monitored"
}

#Environment Variables
rg_location              = "eastus"
environment              = "pd"
application_acronym      = "aks"
location                 = "use"
project_acronym          = "ign"
project_name             = "ignite"
environment_acronym      = "pd"
engagement_name 		 = "cp"
separator				 = "-"
isEngagement			 = true
#app_api_value	         = "igniteui"

#Data Sources
spoke_vnet_name 		= "vnt-use-ase-pd"
spoke_vnet_rg_name 		= "RGP-USE-ASE-PD"
spoke_law_name          = "law-use-spokeapp-pd"
spoke_law_rg_name       = "rgp-use-ase-pd"
pep_subnet_name         = "sub-use-privatelinksrs-pd"



# Private DNS Zone
private_dns_zone_subscription            = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name     = "rgp-use-core-private-dnszone-pd"
private_dns_zone_name_blob               = "privatelink.blob.core.windows.net" 
private_dns_zone_name_psql				 = "privatelink.postgres.database.azure.com"
private_dns_zone_name_cp_acr             = "privatelink.azurecr.io"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
private_dns_zone_name_cognitive          = "privatelink.cognitiveservices.azure.com"

#Route Table Variables
AzureFirewallIPAddress = "10.30.3.4"

#Subnet Variables
ignite_aks_subnet_address_prefix     = "10.4.46.0/23"
ignite_agw_subnet_address_prefix     = "10.4.40.0/28"
ignite_ingress_subnet_address_prefix = "10.4.40.16/28"
#ignite_pep_subnet_address_prefix = "10.50.6.0/24"

# Application Gateway Variables
ignite_jup_fqdn              = "ignitejupdrgs.kpmgcloudops.com"
jup_pfx_cert_name            = "ignitejupcp.kpmgcloudops.com" 
ignite_api_fqdn              = "igniteapidrgs.kpmgcloudops.com"
api_pfx_cert_name            = "igniteapicp.kpmgcloudops.com"
ignite_mio_fqdn              = "ignitemiodrgs.kpmgcloudops.com"
mio_pfx_cert_name            = "ignitemiocp.kpmgcloudops.com"
ignite_ui_fqdn               = "igniteuidrgs.kpmgcloudops.com"
ui_pfx_cert_name             = "igniteuicp.kpmgcloudops.com"
ignite_ui_api_fqdn           = "igniteuiapidrgs.kpmgcloudops.com"
ui_api_pfx_cert_name         = "igniteuiapicp.kpmgcloudops.com"
application_gateway_sku_name = "WAF_v2"
application_gateway_sku_tier = "WAF_v2"
backend_address_pool_ips     = ["10.4.40.25"]


##Key Vault variables
devops_spn_obj_id                = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
devopsspn_service_principal_name = "spn-devops-5d3ae075"

#AKS Variables
aks_node_pool_name		             = "ignitepool"
aks_node_size		                 = "Standard_E20ads_v5"
#aks_api_allow_ip_list                = ["199.207.253.0/24","199.206.0.5/32","52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28","20.62.146.106/32"]
identity_type                        = "SystemAssigned"
enable_auto_scaling                  = "true"
default_node_pool_type               = "VirtualMachineScaleSets"
network_profile_outbound_type        = "userDefinedRouting"
kubernetes_version                   = "1.23.12"
acr_allowed_ip_list                  = ["199.207.253.0/24","199.206.0.5/32","52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28"]
availability_zones                   = ["1"]
ignite_aks_cluster_admins_group_name = "Ignite-cp-AKS-ClusterAdmins-PD"

#PostgresSql Database variables
ignite_postgresql_sku_name								= "GP_Gen5_4"
ignite_postgresql_storageprofile_storage_mb				= "102400"
ignite_postgresql_storageprofile_backup_retention_days	= "7"
ignite_postgresql_storageprofile_geo_redundant_backup	= false
ignite_postgresql_adminname								= "kpmgiGnitedaadmincp"
ignite_postgresql_adminpassword                         = ""
ignite_postgresql_PostGresVersion						= "11"
ignite_connect_postgresql_db_name						= "pgd-use-ign-ui"
ignite_connect_postgresql_db_api_name                   = "pgd-use-ign-api"
ignite_connect_postgresql_db_config_name				= "pgd-use-ign-config"
ignite_connect_postgresql_db_ui_name                    = "pgd-use-ign-ui-pd"
ignite_connect_postgresql_db_content_name               = "pgd-use-ign-content-pd"
drgs_connect_postgresql_db_name                         = "pgd-use-ign-apiv310"

agent_subnet_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"

min_count  = 2
max_count  = 4

# dns_vnet 
DNS_VNET = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"

vpn_whitelist_ips = ["52.146.53.16/32","20.185.109.156/32","52.190.37.75/32","103.58.118.128/25","103.58.118.96/27","1.244.129.34/32","199.207.253.0/24","52.190.37.51/32","52.146.53.140/32","20.185.106.213/32","125.20.85.114/32","199.206.0.5/32","103.133.112.80/28","103.58.118.80/28","52.146.53.139/32","103.216.201.96/28"]

# cognitive_service
cognitive_sku = "S0"