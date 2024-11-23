client_id 									  = "c79c197f-2835-49dc-846a-06644d7f10c4"
subscription_id 							  = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
client_secret 								  = ""
tenant_id 									  = "188697ab-840f-44ec-8535-aaaa5680bab0"

location                                      = "eastus"
location_acronym							  = "use"
environment 								  = "development"
environment_acronym 						  = "dv"
application								      = "cma"
application_acronym					          = "cma"

#This is used in AAD Application Reply URL formation
environment_acronym2 						  = "dev"

#Tags Variables
tags = {
		Environment      = "Development"		
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
app_gateway_hostname         = "cmadev.kpmgcloudops.com"
agw_cert_name                = "cmadev_kpmgcloudops_com"
agw_cert_pfx                 = "cmadev.kpmgcloudops.com"
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
azure_firewall_subscription_id   		= "c72acede-d539-45d9-963d-3464ec4ddae0"
firewall_network_name 					= "firewall-primary-dev-core"
firewall_network_rg_name 				= "CO-dv-eastus-hubvnet-rg"

#VirtualMachine Variables
vm_os_type                 				= "VM"
vm_count 							    = "2"
vm_size 							    = "Standard_D8s_v3"
data_disk_size                          = "200"
adminusername 						    = "cmadvadmin"
vm_admin_password                       = ""
custom_emails 						    = "go-fmmanagedservices@kpmg.com"

#shared services
shared_resource_group_name  		    = "RGP-USE-ASE-DV"
shared_virtual_network_name				= "vnt-use-ase-dv"
ase_subnet_name							= "sub-use-ase-dv"
ase_name                         		= "ase-use-dvapp-dv"

#App Service Plan
app_service_plan_tier			 		= "Isolated"
app_service_plan_size			 		= "I3"

#App Service
flask_env				      			= "development"
appservice_log_retention_days 			= "7"
appservice_log_retention_mb	  			= "35"
cma_client_id				  			= "3de1f55d-6235-4bd0-b1aa-b4277e794cec"
cma_client_secret			  			= "Keep the Secret in Key Vault and not here in Web App Config"
initial_user				  			= "test2@kpmgnpsand.onmicrosoft.com"

#Storage Account
account_tier                            = "Standard"
replication_type                        = "RAGRS"

#Shared State Configuration
shared_state_resource_group_name 			= "RGP-USE-COMMON"
shared_state_storage_account_name 			= "stousecommon57fad7dc"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name 	= "iac-acc-shared-ras.dv.tfstate"
shared_state_storage_account_access_key     = ""