client_id 									  = "a7fa3ac8-fa4f-480f-abc5-5bca284ff70b"
subscription_id 							  = "0bc2885b-be48-4e3d-afe1-4fb6e0930f5a"
client_secret 								  = ""
tenant_id 									  = "b5031e57-d76f-422e-87c6-02b4cc749974"

location                                      = "eastus"
location_acronym							  = "use"
environment 								  = "staging"
environment_acronym 						  = "stg"
application								      = "cma"
application_acronym					          = "cma"

#This is used in AAD Application Reply URL formation
environment_acronym2 						  = "staging"

#Tags Variables
tags = {
		Environment      = "Staging"		
		BusinessOwner    = "Max Green"
		BusinessContact  = "dmgreen@kpmg.com"		
		LOB 		     = "Consulting"		
		Node             = "Spoke"
		Platform         = "Azure Commercial Cloud"
		Solution         = "Count Management Application (CMA)"
		TechnicalContact = "btwatanabe@kpmg.com"
		TechnicalOwner   = "Ben Watanabe"
}

#postgresql server and db
postgresql_server_sku                         = "GP_Gen5_4"
postgresql_server_admin                  	  = "cmaadmin"
postgresql_server_admin_password         	  = ""
storage_mb                               	  = "102400"

#Application Gateway Variables
app_gateway_hostname         = "cmastaging.kpmgcloudops.com"
agw_cert_name                = "cmastaging_kpmgcloudops_com"
agw_cert_pfx                 = "cmastaging.kpmgcloudops.com"
app_gateway_certpfx_password = ""
agw_cert_cer                 = "kpmgcloudops.com"
ase_internal_ip              = "Staging will be setup in future"

#subnet
cma_appgateway_subnet_address_prefix   = "Staging will be setup in future"
cma_pbiwst_subnet_prefix               = "Staging will be setup in future"
cma_buildmachine_subnet_prefix         = "Staging will be setup in future"
cma_pbigatewaymachine_subnet_prefix    = "Staging will be setup in future"
service_endpoints                      = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]

#Azure Firewal Route Details
az_firewall_route_name					= "OutboundTrafficAzureFirewall"
az_firewall_address_prefix				= "0.0.0.0/0"
az_firewall_next_hop_type				= "VirtualAppliance"

#Azure Firewall Variables
azure_firewall_subscription_id   		= "169d52bf-6f65-47d7-8f3e-e5c67d6ee19e"
firewall_network_name 					= "Staging will be setup in future"
firewall_network_rg_name 				= "Staging will be setup in future"

#VirtualMachine Variables
vm_os_type                 				= "VM"
vm_count 							    = "2"
vm_size 							    = "Standard_D8s_v3"
data_disk_size                          = "200"
adminusername 						    = "cmadvadmin"
vm_admin_password                       = ""
custom_emails 						    = "go-fmmanagedservices@kpmg.com"

#shared services
shared_resource_group_name  		    = "Staging will be setup in future"
shared_virtual_network_name				= "Staging will be setup in future"
ase_subnet_name							= "Staging will be setup in future"
ase_name                         		= "Staging will be setup in future"

#App Service Plan
app_service_plan_tier			 		= "Isolated"
app_service_plan_size			 		= "I3"

#App Service
flask_env				      			= "staging"
appservice_log_retention_days 			= "7"
appservice_log_retention_mb	  			= "35"
cma_client_id				  			= "Need to check with CMA Application Team"
cma_client_secret			  			= "Keep the Secret in Key Vault and not here in Web App Config"
initial_user				  			= "Need to check with CMA Application Team"

#Storage Account
account_tier                            = "Standard"
replication_type                        = "RAGRS"

#Shared State Configuration
shared_state_resource_group_name 			= "RGP-USE-COMMON"
shared_state_storage_account_name 			= "stousecommon0bc2885b"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name 	= ""
shared_state_storage_account_access_key     = ""