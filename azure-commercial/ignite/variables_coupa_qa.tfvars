#Backend Variables
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"
subscription_id = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
client_id       = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
client_secret   = ""

#Tags
tags = {
	Environment     = "QA"
	LOB	        	= "Consulting"
	Node            = "Spoke"
	Platform        = "Azure Commercial Cloud"
	Solution        = "Ignite"
	BusinessContact = "tgunarathne@kpmg.com"
	BusinessOwner   = "Thilina Gunarathne"
}

#Environment Variables
rg_location              = "eastus"
environment              = "qa"
application_acronym      = "aks"
location                 = "use"
project_acronym          = "ign"
project_name             = "ignite"
environment_acronym      = "qa"
engagement_name 		 = "coupa"
separator				 = "-"
isEngagement			 = true

#Data Sources
spoke_vnet_name 		= "vnt-use-ase-qa"
spoke_vnet_rg_name 		= "RGP-USE-ASE-QA"
spoke_law_name          = "law-use-spokeapp-qa"
spoke_law_rg_name       = "rgp-use-ase-qa"

#Route Table Variables
AzureFirewallIPAddress = "10.101.2.196"

#Subnet Variables
ignite_aks_subnet_address_prefix     = "10.70.16.0/22"
ignite_agw_subnet_address_prefix     = "10.70.20.0/28"
ignite_ingress_subnet_address_prefix = "10.70.20.16/28"


# Application Gateway Variables
ignite_jup_fqdn              = "ignitejupcoupaqa.kpmgcloudops.com"
jup_pfx_cert_name            = "ignitejupcoupa.kpmgcloudops.com"
ignite_api_fqdn              = "igniteapicoupaqa.kpmgcloudops.com"
api_pfx_cert_name            = "igniteapicoupa.kpmgcloudops.com"
ignite_mio_fqdn              = "ignitemiocoupaqa.kpmgcloudops.com"
mio_pfx_cert_name            = "ignitemiocoupa.kpmgcloudops.com"
ignite_ui_fqdn               = "igniteuicoupaqa.kpmgcloudops.com"
ui_pfx_cert_name             = "igniteuicoupa.kpmgcloudops.com"
ignite_ui_api_fqdn           = "igniteuiapicoupaqa.kpmgcloudops.com"
ui_api_pfx_cert_name         = "igniteuiapicoupa.kpmgcloudops.com"
application_gateway_sku_name = "WAF_V2"
application_gateway_sku_tier = "WAF_V2"
backend_address_pool_ips     = ["10.70.20.20"]

##Key Vault variables
devops_spn_obj_id                = "2995a923-5fd3-4b7d-8cbe-ef1074ef7921"
devopsspn_service_principal_name = "spn-devops-rcdigital"

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
ignite_aks_cluster_admins_group_name = "Ignite-coupa-AKS-ClusterAdmins-QA"

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
ignite_connect_postgresql_db_ui_name                    = "pgd-use-ign-ui-qa"
ignite_connect_postgresql_db_content_name               = "pgd-use-ign-content-qa"

agent_subnet_id    = "/subscriptions/5ce45d57-3192-4bfe-9c2f-cb567b30c586/resourceGroups/RGP-USE-COREVNET-QA/providers/Microsoft.Network/virtualNetworks/vnt-use-core-qa/subnets/sub-use-infra1-qa"


min_count  = 4
max_count  = 14