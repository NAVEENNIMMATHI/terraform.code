client_id 									  = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
subscription_id 							  = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
client_secret 								  = ""
tenant_id 									  = "b5031e57-d76f-422e-87c6-02b4cc749974"

location                                      = "eastus"
location_acronym							  = "use"
environment 								  = "production"
environment_acronym 						  = "pd"
application								      = "cma"
application_acronym					          = "cma"

#This is used in AAD Application Reply URL formation
environment_acronym2 						  = ""

#Tags Variables
tags = {
		Environment      = "Production"		
		BusinessOwner    = "Max Green"
		BusinessContact  = "dmgreen@kpmg.com"		
		LOB 		     = "Consulting"		
		Node             = "Spoke"
		Platform         = "Azure Commercial Cloud"
		Solution         = "Count Management Application (CMA)"
		TechnicalContact = "btwatanabe@kpmg.com"
		TechnicalOwner   = "Ben Watanabe"
		Datadog                 = "Monitored"
}

#postgresql server and db
postgresql_server_sku                         = "GP_Gen5_4"
postgresql_server_admin                  	  = "cmaadmin"
postgresql_server_admin_password         	  = ""
storage_mb                               	  = "102400"

#Application Gateway Variables
app_gateway_hostname         = "cma.kpmgcloudops.com"
agw_cert_name                = "cma_kpmgcloudops_com"
agw_cert_pfx                 = "cma.kpmgcloudops.com"
app_gateway_certpfx_password = ""
agw_cert_cer                 = "kpmgcloudops.com"
ase_internal_ip              =  "10.4.16.11"

#subnet
cma_appgateway_subnet_address_prefix   = "10.4.21.96/28"
cma_pbiwst_subnet_prefix               = "10.4.21.128/28"
cma_buildmachine_subnet_prefix         = "10.4.21.144/28"
cma_pbigatewaymachine_subnet_prefix    = "10.4.21.112/28"
service_endpoints                      = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault"]

#Azure Firewal Route Details
az_firewall_route_name					= "OutboundTrafficAzureFirewall"
az_firewall_address_prefix				= "0.0.0.0/0"
az_firewall_next_hop_type				= "VirtualAppliance"

#Azure Firewall Variables
azure_firewall_subscription_id   		= "4c9dc048-01dc-4854-9063-8a3d4060993a"
firewall_network_name 					= "firewall-primary-prod-hub"
firewall_network_rg_name 				= "CO-P-eastus-hubvnet-rg"

#VirtualMachine Variables
vm_os_type                 				= "VM"
vm_count 							    = "2"
vm_size 							    = "Standard_D8s_v3"
data_disk_size                          = "200"
adminusername 						    = "cmadvadmin"
vm_admin_password                       = ""
custom_emails 						    = "go-fmmanagedservices@kpmg.com"

#shared services
shared_resource_group_name  		    = "RGP-USE-ASE-PD"
shared_virtual_network_name				= "vnt-use-ase-pd"
ase_subnet_name							= "sub-use-ase-pd"
ase_name                         		= "ase-use-npapp-pd"

#App Service Plan
app_service_plan_tier			 		= "Isolated"
app_service_plan_size			 		= "I3"

#App Service
flask_env				      			= "production"
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
shared_state_storage_account_name 			= "stousebase5d3ae075"
shared_state_storage_account_container_name = "terraformstatecontainer"
shared_state_storage_account_blob_key_name 	= "iac-acc-shared-ras.pd.tfstate"
shared_state_storage_account_access_key     = ""