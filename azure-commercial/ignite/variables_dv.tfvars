#Backend Variables
tenant_id = "188697ab-840f-44ec-8535-aaaa5680bab0"
subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_id = "c79c197f-2835-49dc-846a-06644d7f10c4"
client_secret = ""

#Tags
tags = {
	Environment     = "Development"
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
environment              = "dv"
application_acronym      = "aks"
location                 = "use"
project_acronym          = "ign"
project_name             = "ignite"
environment_acronym      = "dv"
engagement_name 		 = ""
separator				 = ""
isEngagement 			 = false
#app_api_value	         = "igniteui"

#Data Sources
spoke_vnet_name 		= "vnt-use-ase-dv"
spoke_vnet_rg_name 		= "RGP-USE-ASE-DV"
spoke_law_name          = "law-use-spokeapp-dv"
spoke_law_rg_name       = "rgp-use-ase-dv"

#Route Table Variables
AzureFirewallIPAddress = "10.6.24.4"

#Subnet Variables
ignite_aks_subnet_address_prefix     = "10.50.8.0/21"
ignite_agw_subnet_address_prefix     = "10.50.4.48/28"
ignite_ingress_subnet_address_prefix = "10.50.4.32/28"

# Application Gateway Variables
ignite_jup_fqdn              = "ignitejupdv.kpmgcloudops.com"
jup_pfx_cert_name            = "ignitejup.kpmgcloudops.com"
ignite_api_fqdn              = "igniteapidv.kpmgcloudops.com"
api_pfx_cert_name            = "igniteapi.kpmgcloudops.com"
ignite_mio_fqdn              = "ignitemiodv.kpmgcloudops.com"
mio_pfx_cert_name            = "ignitemio.kpmgcloudops.com"
ignite_ui_fqdn               = "igniteuidv.kpmgcloudops.com"
ui_pfx_cert_name             = "igniteui.kpmgcloudops.com"
ignite_ui_api_fqdn           = "igniteuiapidv.kpmgcloudops.com"
ui_api_pfx_cert_name         = "igniteuiapi.kpmgcloudops.com"
application_gateway_sku_name = "WAF_V2"
application_gateway_sku_tier = "WAF_V2"
backend_address_pool_ips     = ["10.50.4.40"]


##Key Vault variables
devops_spn_obj_id                = "2995a923-5fd3-4b7d-8cbe-ef1074ef7921"
devopsspn_service_principal_name = "spn-devops-rcdigital"

#AKS Variables
aks_node_pool_name		             = "ignitepool"
aks_node_size		                 = "Standard_D8s_v3"
aks_api_allow_ip_list                = ["199.207.253.0/24","199.206.0.5/32","52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28","20.62.146.106/32"]
identity_type                        = "SystemAssigned"
enable_auto_scaling                  = "false"
default_node_pool_type               = "VirtualMachineScaleSets"
network_profile_outbound_type        = "userDefinedRouting"
kubernetes_version                   = "1.20.7"
acr_allowed_ip_list                  = ["199.207.253.0/24","199.206.0.5/32","52.190.37.51/32","52.190.37.75/32","52.146.53.140/32","52.146.53.139/32","52.146.53.16/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28"]
availability_zones                   = ["1"]
ignite_aks_cluster_admins_group_name = "Ignite-AKS-ClusterAdmins-DEV"

#PostgresSql Database variables
ignite_postgresql_sku_name								= "GP_Gen5_4"
ignite_postgresql_storageprofile_storage_mb				= "5120"
ignite_postgresql_storageprofile_backup_retention_days	= "7"
ignite_postgresql_storageprofile_geo_redundant_backup	= "Disabled"
ignite_postgresql_adminname								= "kpmgiGnitedaadmin"
ignite_postgresql_adminpassword                         = ""
ignite_postgresql_PostGresVersion						= "11"
ignite_connect_postgresql_db_name						= "pgd-use-ign-ui"
ignite_connect_postgresql_db_api_name                   = "pgd-use-ign-api"
ignite_connect_postgresql_db_config_name				= "pgd-use-ign-config"
ignite_connect_postgresql_db_ui_name                    = "pgd-use-ign-ui-dv"
ignite_connect_postgresql_db_content_name               = "pgd-use-ign-content-dv"

agent_subnet_id    = "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/co-dv-eastus-infra1-subnet"

min_count  = 4
max_count  = 14

cognitive_sku = "S0"