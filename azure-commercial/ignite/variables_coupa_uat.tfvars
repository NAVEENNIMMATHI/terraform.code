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
}

#Environment Variables
rg_location              = "eastus"
environment              = "uat"
application_acronym      = "aks"
location                 = "use"
project_acronym          = "ign"
project_name             = "ignite"
environment_acronym      = "uat"
engagement_name 		 = "coupa"
separator				 = "-"
isEngagement			 = true

#Data Sources
spoke_vnet_name 		= "vnt-use-ase-uat"
spoke_vnet_rg_name 		= "RGP-USE-ASE-UAT"
spoke_law_name          = "law-use-sharedras-uat"
spoke_law_rg_name       = "rgp-use-ase-uat"

#Route Table Variables
AzureFirewallIPAddress = "10.100.2.196"

#Subnet Variables
ignite_aks_subnet_address_prefix     = "10.50.80.0/22"
ignite_agw_subnet_address_prefix     = "10.50.84.0/28"
ignite_ingress_subnet_address_prefix = "10.50.84.16/28"


# Application Gateway Variables
ignite_jup_fqdn              = "ignitejupcoupaut.kpmgcloudops.com"
jup_pfx_cert_name            = "ignitejupcoupa.kpmgcloudops.com"
ignite_api_fqdn              = "igniteapicoupaut.kpmgcloudops.com"
api_pfx_cert_name            = "igniteapicoupa.kpmgcloudops.com"
ignite_mio_fqdn              = "ignitemiocoupaut.kpmgcloudops.com"
mio_pfx_cert_name            = "ignitemiocoupa.kpmgcloudops.com"
ignite_ui_fqdn               = "igniteuicoupaut.kpmgcloudops.com"
ui_pfx_cert_name             = "igniteuicoupa.kpmgcloudops.com"
ignite_ui_api_fqdn           = "igniteuiapicoupaut.kpmgcloudops.com"
ui_api_pfx_cert_name         = "igniteuiapicoupa.kpmgcloudops.com"
application_gateway_sku_name = "WAF_V2"
application_gateway_sku_tier = "WAF_V2"
backend_address_pool_ips     = ["10.50.84.20"]

##Key Vault variables
devops_spn_obj_id                = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
devopsspn_service_principal_name = "spn-devops-104a6d25"

#AKS Variables
aks_node_pool_name		             = "ignitepool"
aks_node_size		                 = "Standard_D8s_v3"
aks_api_allow_ip_list                = ["199.207.253.0/24","199.206.0.5/32","40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28"]
identity_type                        = "SystemAssigned"
enable_auto_scaling                  = "false"
default_node_pool_type               = "VirtualMachineScaleSets"
network_profile_outbound_type        = "userDefinedRouting"
kubernetes_version                   = "1.21.9"
acr_allowed_ip_list                  = ["199.207.253.0/24","199.206.0.5/32","40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32","20.185.109.156/32","20.185.106.213/32","103.216.201.96/28","103.58.118.96/27","1.244.129.34/32","125.20.85.114/32","103.58.118.128/25","103.58.118.80/28","103.133.112.80/28"]
availability_zones                   = ["1"]
ignite_aks_cluster_admins_group_name = "Ignite-coupa-AKS-ClusterAdmins-UAT"

#PostgresSql Database variables
ignite_postgresql_sku_name								= "GP_Gen5_4"
ignite_postgresql_storageprofile_storage_mb				= "102400"
ignite_postgresql_storageprofile_backup_retention_days	= "7"
ignite_postgresql_storageprofile_geo_redundant_backup	= "Disabled"
ignite_postgresql_adminname								= "kpmgiGnitedaadmin"
ignite_postgresql_adminpassword                         = ""
ignite_postgresql_PostGresVersion						= "11"
ignite_connect_postgresql_db_name						= "pgd-use-ign-ui"
ignite_connect_postgresql_db_api_name                   = "pgd-use-ign-api"
ignite_connect_postgresql_db_config_name				= "pgd-use-ign-config"
ignite_connect_postgresql_db_ui_name                    = "pgd-use-ign-ui-uat"
ignite_connect_postgresql_db_content_name               = "pgd-use-ign-content-uat"


agent_subnet_id    = "/subscriptions/931d8a2f-96bb-44d3-9b06-6c05c41c4060/resourceGroups/RGP-USE-COREVNET-UAT/providers/Microsoft.Network/virtualNetworks/vnt-use-core-uat/subnets/sub-use-infra1-uat"

min_count  = 4
max_count  = 14