client_id 									  = "65d6e9b3-65b7-42b9-9f30-89d6a33becf8"
subscription_id 							  = "96e9a7e6-da33-4993-89ca-b82e0b571aee"
client_secret 								  = ""
tenant_id 									  = "188697ab-840f-44ec-8535-aaaa5680bab0"

location                                      = "eastus"
location_acronym							  = "use"
environment 								  = "qa"
environment_acronym 						  = "qa"
application								      = "cma"
application_acronym					          = "cma"

#This is used in AAD Application Reply URL formation
environment_acronym2 						  = "qa"

#Tags Variables
tags = {
		Environment      = "QA"		
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
app_gateway_hostname         = "cmaqa.kpmgcloudops.com"
agw_cert_name                = "cmaqa_kpmgcloudops_com"
agw_cert_pfx                 = "cmaqa.kpmgcloudops.com"
app_gateway_certpfx_password = ""
agw_cert_cer                 = "kpmgcloudops.com"
ase_internal_ip              =  "10.70.0.11"

#subnet
cma_appgateway_subnet_address_prefix   = "10.70.20.96/28"
cma_pbiwst_subnet_prefix               = "10.70.20.128/28"
cma_buildmachine_subnet_prefix         = "10.70.20.144/28"
cma_pbigatewaymachine_subnet_prefix    = "10.70.20.112/28"
service_endpoints                      = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]

#Azure Firewal Route Details
az_firewall_route_name					= "OutboundTrafficAzureFirewall"
az_firewall_address_prefix				= "0.0.0.0/0"
az_firewall_next_hop_type				= "VirtualAppliance"

#Azure Firewall Variables
azure_firewall_subscription_id   		= "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
firewall_network_name 					= "fwl-use-primary-qa-core"
firewall_network_rg_name 				= "RGP-USE-COREVNET-QA"

#VirtualMachine Variables
vm_os_type                 				= "VM"
vm_count 							    = "2"
vm_size 							    = "Standard_D8s_v3"
data_disk_size                          = "200"
adminusername 						    = "cmadvadmin"
vm_admin_password                       = ""
custom_emails 						    = "go-fmmanagedservices@kpmg.com"

#shared services
shared_resource_group_name  		    = "RGP-USE-ASE-QA"
shared_virtual_network_name				= "vnt-use-ase-qa"
ase_subnet_name							= "sub-use-ase-qa"
ase_name                         		= "ase-use-qaapp-qa"

#App Service Plan
app_service_plan_tier			 		= "Isolated"
app_service_plan_size			 		= "I3"

#App Service
flask_env				      			= "qa"
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
shared_state_storage_account_name 			= "stousecommon96e9a7e6"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name 	= "iac-acc-shared-ras.qa.tfstate"
shared_state_storage_account_access_key     = ""