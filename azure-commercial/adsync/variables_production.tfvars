tenant_id 							= "b5031e57-d76f-422e-87c6-02b4cc749974"
subscription_id 					= "4c9dc048-01dc-4854-9063-8a3d4060993a"
client_id 							= "d43ed344-3d08-4001-8174-7e7a8f1920d9"
client_secret 						= ""

#Environment
location                        	= "eastus"
location_acronym					= "use"
environment                     	= "production"
environment_acronym					= "pd"
application							= "adsync"
application_acronym             	= "adsync"
tags = {
		ApplicationName 			= "ADSYNC"
		BusinessContact 			= "go-fmmanagedservices@kpmg.com"
		BusinessOwner 				= "Advisory Cloud Operations"
		Environment 				= "Production"
		LOB 						= "Advisory Other"
		Node 						= "Hub"
		Platform 					= "Azure Commercial Cloud"
		Solution 					= "Core - AD Sync"
		Datadog                     = "Monitored"
}

#App Service
app_service_environment_name 	 	= "ase-use-core-pd"
coresubscriptionid 					= "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnetresourcegroup 				= "CO-P-eastus-hubvnet-rg"
corevnetname 						= "CO-P-eastus-hub-vnet"
coreasesubnet						= "sub-use-core-ase-pd"

#Key Vault
keyvault_aadsyncspn_obj_id 			= "b057648c-dd77-456e-ba1f-5968ed783918"

#Function App
active_directory_client_id			= "ba46dff9-a33a-4d9d-b1bc-7ad3122eb09d"