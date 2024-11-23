client_id 									  = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
subscription_id 							  = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_secret 								  = ""
tenant_id 									  = "b5031e57-d76f-422e-87c6-02b4cc749974"

location                                      = "eastus"
location_acronym							  = "use"
environment 								  = "uat"
environment_acronym 						  = "uat"
application								      = "cma"
application_acronym					          = "cma"

#This is used in AAD Application Reply URL formation
environment_acronym2 						  = "uat"

#Tags Variables
tags = {
		Environment      = "UAT"		
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
app_gateway_hostname         = "cmauat.kpmgcloudops.com"
agw_cert_name                = "cmauat_kpmgcloudops_com"
agw_cert_pfx                 = "cmauat.kpmgcloudops.com"
app_gateway_certpfx_password = ""
agw_cert_cer                 = "kpmgcloudops.com"
ase_internal_ip              =  "10.50.0.11"

#subnet
cma_appgateway_subnet_address_prefix   = "10.50.20.96/28"
cma_pbiwst_subnet_prefix               = "10.50.20.128/28"
cma_buildmachine_subnet_prefix         = "10.50.20.144/28"
cma_pbigatewaymachine_subnet_prefix    = "10.50.20.112/28"
service_endpoints                      = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]

#Azure Firewal Route Details
az_firewall_route_name					= "OutboundTrafficAzureFirewall"
az_firewall_address_prefix				= "0.0.0.0/0"
az_firewall_next_hop_type				= "VirtualAppliance"

#Azure Firewall Variables
azure_firewall_subscription_id   		= "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
firewall_network_name 					= "fwl-use-primary-uat-core"
firewall_network_rg_name 				= "RGP-USE-COREVNET-UAT"

#VirtualMachine Variables
vm_os_type                 				= "VM"
vm_count 							    = "2"
vm_size 							    = "Standard_D8s_v3"
data_disk_size                          = "200"
adminusername 						    = "cmadvadmin"
vm_admin_password                       = ""
custom_emails 						    = "go-fmmanagedservices@kpmg.com"

#shared services
shared_resource_group_name  		    = "RGP-USE-ASE-UAT"
shared_virtual_network_name				= "vnt-use-ase-uat"
ase_subnet_name							= "sub-use-ase-uat"
ase_name                         		= "ase-use-sharedras-uat"

#App Service Plan
app_service_plan_tier			 		= "Isolated"
app_service_plan_size			 		= "I3"

#App Service
flask_env				      			= "uat"
appservice_log_retention_days 			= "7"
appservice_log_retention_mb	  			= "35"
cma_client_id				  			= "1c92648d-abd2-4984-bd36-d5c6f55c053c"
cma_client_secret			  			= "Keep the Secret in Key Vault and not here in Web App Config"
initial_user				  			= "cma-super1@kpmgusadvcloudops.onmicrosoft.com"

#Storage Account
account_tier                            = "Standard"
replication_type                        = "RAGRS"

#Shared State Configuration
shared_state_resource_group_name 			= "RGP-USE-COMMON"
shared_state_storage_account_name 			= "stousecommon104a6d25"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name 	= "iac-acc-shared-ras.uat.tfstate"
shared_state_storage_account_access_key     = ""