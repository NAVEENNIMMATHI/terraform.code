#Backend Variables
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
client_secret   = ""

#Tags
tags = {
	Environment     = "UAT"
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
environment              = "uat"
application_acronym      = "aks"
location                 = "use"
project_acronym          = "ign"
project_name             = "ignite"
environment_acronym      = "uat"
engagement_name 		 = "cp"
separator				 = "-"
isEngagement			 = true
#app_api_value	         = "igniteui"

#Data Sources
spoke_vnet_name 		= "vnt-use-ase-uat"
spoke_vnet_rg_name 		= "RGP-USE-ASE-UAT"
spoke_law_name          = "law-use-sharedras-uat"
spoke_law_rg_name       = "rgp-use-ase-uat"
pep_subnet_name         = "sub-use-privatelink1-uat"


# Private DNS Zone
private_dns_zone_subscription            = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name     = "rgp-use-core-private-dnszone-pd"
private_dns_zone_name_blob               = "privatelink.blob.core.windows.net" 
private_dns_zone_name_psql				 = "privatelink.postgres.database.azure.com"
private_dns_zone_name_cp_acr             = "privatelink.azurecr.io"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
private_dns_zone_name_cognitive          = "privatelink.cognitiveservices.azure.com"

#Route Table Variables
AzureFirewallIPAddress = "10.100.2.196"

#Subnet Variables
ignite_aks_subnet_address_prefix     = "10.50.80.0/22"
ignite_agw_subnet_address_prefix     = "10.50.84.0/28"
ignite_ingress_subnet_address_prefix = "10.50.84.16/28"
#ignite_pep_subnet_address_prefix = "10.50.6.0/24"

# Application Gateway Variables
ignite_jup_fqdn              = "ignitejupcput.kpmgcloudops.com"
jup_pfx_cert_name            = "ignitejupcp.kpmgcloudops.com" 
ignite_api_fqdn              = "igniteapicput.kpmgcloudops.com"
api_pfx_cert_name            = "igniteapicp.kpmgcloudops.com"
ignite_mio_fqdn              = "ignitemiocput.kpmgcloudops.com"
mio_pfx_cert_name            = "ignitemiocp.kpmgcloudops.com"
ignite_ui_fqdn               = "igniteuicput.kpmgcloudops.com"
ui_pfx_cert_name             = "igniteuicp.kpmgcloudops.com"
ignite_ui_api_fqdn           = "igniteuiapicput.kpmgcloudops.com"
ui_api_pfx_cert_name         = "igniteuiapicp.kpmgcloudops.com"
application_gateway_sku_name = "WAF_v2"
application_gateway_sku_tier = "WAF_v2"
backend_address_pool_ips     = ["10.50.84.20"]


##Key Vault variables
devops_spn_obj_id                = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
devopsspn_service_principal_name = "spn-devops-104a6d25"

#AKS Variables
aks_node_pool_name		             = "ignitepool"
aks_node_size		                 = "Standard_E20ads_v5"
#aks_api_allow_ip_list                = ["199.207.253.0/24","199.206.0.5/32","52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28","20.62.146.106/32"]
identity_type                        = "SystemAssigned"
enable_auto_scaling                  = "true"
default_node_pool_type               = "VirtualMachineScaleSets"
network_profile_outbound_type        = "userDefinedRouting"
kubernetes_version                   = "1.22.11"
acr_allowed_ip_list                  = ["199.207.253.0/24","199.206.0.5/32","52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28"]
availability_zones                   = ["1"]
ignite_aks_cluster_admins_group_name = "Ignite-cp-AKS-ClusterAdmins-UAT"

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
ignite_connect_postgresql_db_ui_name                    = "pgd-use-ign-ui-uat"
ignite_connect_postgresql_db_content_name               = "pgd-use-ign-content-uat"
drgs_connect_postgresql_db_name                         = "pgd-use-ign-apiv310"

agent_subnet_id    = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"

min_count  = 2
max_count  = 4

# dns_vnet 
DNS_VNET = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"

vpn_whitelist_ips = ["52.146.53.16/32","20.185.109.156/32","52.190.37.75/32","103.58.118.128/25","103.58.118.96/27","1.244.129.34/32","199.207.253.0/24","52.190.37.51/32","52.146.53.140/32","20.185.106.213/32","125.20.85.114/32","199.206.0.5/32","103.133.112.80/28","103.58.118.80/28","52.146.53.139/32","103.216.201.96/28"]

# cognitive_service
cognitive_sku = "S0"