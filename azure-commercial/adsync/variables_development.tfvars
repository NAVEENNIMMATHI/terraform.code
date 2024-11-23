tenant_id 							= "188697ab-840f-44ec-8535-aaaa5680bab0"
subscription_id 					= "c72acede-d539-45d9-963d-3464ec4ddae0"
client_id 							= "f294bc17-39a8-477e-aeac-b73870cc67b5"
client_secret 						= ""

#Environment
location                        	= "eastus"
location_acronym					= "use"
environment                     	= "development"
environment_acronym					= "dv"
application							= "adsync"
application_acronym             	= "adsync"
tags = {
		ApplicationName 			= "ADSYNC"
		BusinessContact 			= "go-fmmanagedservices@kpmg.com"
		BusinessOwner 				= "Advisory Cloud Operations"
		Environment 				= "Development"
		LOB 						= "Advisory Other"
		Node 						= "Hub"
		Platform 					= "Azure Commercial Cloud"
		Solution 					= "Core - AD Sync"
}

#App Service
app_service_environment_name 	 	= "ase-use-core-dv"
coresubscriptionid 					= "c72acede-d539-45d9-963d-3464ec4ddae0"
corevnetresourcegroup 				= "CO-dv-eastus-hubvnet-rg"
corevnetname 						= "CO-dv-eastus-hub-vnet"
coreasesubnet						= "sub-use-core-ase-dv"

#Key Vault
keyvault_aadsyncspn_obj_id 			= "9f030612-d13e-4bed-a9c5-850659375cd4"

#Function App
active_directory_client_id			= "eb751814-9520-4bf0-b2fd-9cbeaf3649b4"