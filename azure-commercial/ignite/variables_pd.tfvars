#Backend Variables
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
client_secret   = ""

#Tags
tags = {
	Environment     = "Production"
	LOB	            = "Consulting"
	Node            = "Spoke"
	Platform        = "Azure Commercial Cloud"
	Solution        = "Ignite"
	BusinessContact = "tgunarathne@kpmg.com"
	BusinessOwner   = "Thilina Gunarathne"
	Datadog         = "Monitored"
}

#Environment Variables
rg_location              = "eastus"
environment              = "pd"
application_acronym      = "aks"
location                 = "use"
project_acronym          = "ign"
project_name             = "ignite"
environment_acronym      = ""
engagement_name 		 = ""
separator				 = ""
isEngagement 			 = false

#Data Sources
spoke_vnet_name 		= "vnt-use-ase-pd"
spoke_vnet_rg_name 		= "RGP-USE-ASE-PD"
spoke_law_name          = "law-use-spokeapp-pd"
spoke_law_rg_name       = "RGP-USE-ASE-PD"

#Route Table Variables
AzureFirewallIPAddress = "10.30.3.4"

#Subnet Variables
ignite_aks_subnet_address_prefix     = "10.4.24.0/21"
ignite_agw_subnet_address_prefix     = "10.4.20.224/28"
ignite_ingress_subnet_address_prefix = "10.4.20.240/28"


# Application Gateway Variables
ignite_jup_fqdn              = "ignitejup.kpmgcloudops.com"
jup_pfx_cert_name            = "ignitejup.kpmgcloudops.com"
ignite_api_fqdn              = "igniteapi.kpmgcloudops.com"
api_pfx_cert_name            = "igniteapi.kpmgcloudops.com"
ignite_mio_fqdn              = "ignitemio.kpmgcloudops.com"
mio_pfx_cert_name            = "ignitemio.kpmgcloudops.com"
ignite_ui_fqdn               = "igniteui.kpmgcloudops.com"
ui_pfx_cert_name             = "igniteui.kpmgcloudops.com"
ignite_ui_api_fqdn           = "igniteuiapi.kpmgcloudops.com"
ui_api_pfx_cert_name         = "igniteuiapi.kpmgcloudops.com"
application_gateway_sku_name = "WAF_V2"
application_gateway_sku_tier = "WAF_V2"
backend_address_pool_ips     = ["10.4.20.248"]

##Key Vault variables
devops_spn_obj_id                = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
devopsspn_service_principal_name = "spn-devops-5d3ae075"

#AKS Variables
aks_node_pool_name		             = "ignitepool"
aks_node_size		                 = "Standard_D16s_v3"
aks_api_allow_ip_list                = ["199.207.253.0/24","199.206.0.5/32","52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32","20.185.109.156/32","20.185.106.213/32","20.185.106.126/32","20.185.110.197/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28"]
identity_type                        = "SystemAssigned"
enable_auto_scaling                  = "true"
default_node_pool_type               = "VirtualMachineScaleSets"
network_profile_outbound_type        = "userDefinedRouting"
kubernetes_version                   = "1.21.9"
acr_allowed_ip_list                  = ["199.207.253.0/24","199.206.0.5/32","52.224.25.180/32","52.224.25.158/32","52.224.25.140/32","20.42.39.126/32","52.224.25.167/32","20.185.109.156/32","20.185.106.213/32","20.185.106.126/32","20.185.110.197/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28"]
availability_zones                   = ["1"]
ignite_aks_cluster_admins_group_name = "Ignite-AKS-ClusterAdmins-PD"

#PostgresSql Database variables
ignite_postgresql_sku_name								= "GP_Gen5_4"
ignite_postgresql_storageprofile_storage_mb				= "1024000"
ignite_postgresql_storageprofile_backup_retention_days	= "7"
ignite_postgresql_storageprofile_geo_redundant_backup	= "Disabled"
ignite_postgresql_adminname								= "kpmgiGnitedaadmin"
ignite_postgresql_adminpassword                         = ""
ignite_postgresql_PostGresVersion						= "11"
ignite_connect_postgresql_db_name						= "pgd-use-ign-ui"
ignite_connect_postgresql_db_api_name                   = "pgd-use-ign-api"
ignite_connect_postgresql_db_config_name				= "pgd-use-ign-config"
ignite_connect_postgresql_db_ui_name                    = "pgd-use-ign-ui-pd"
ignite_connect_postgresql_db_content_name               = "pgd-use-ign-content-pd"

agent_subnet_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"

min_count  = 4
max_count  = 14
cognitive_sku = "S0"