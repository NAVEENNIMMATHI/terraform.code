client_id =                                             "b2967f11-d801-4812-b532-3f3a676e8b46"
subscription_id =                                       "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id =                                             "b5031e57-d76f-422e-87c6-02b4cc749974"

tags = {
	BusinessContact = 									"johair@KPMG.com"
	BusinessOwner = 									"Joel O'Hair"
	Environment = 										"Staging"
	LOB	= 												"Deal Advisory & Strategy"
	Node =  											"Spoke"
	Platform = 											"Azure Commercial Cloud"
	Solution = 											"Alteryx"
}


#Database Configuration
sql_server_admin_username =								""
sql_server_version =									"12.0"


#Key Vaults
keyvault_admin_group_name =                             ""
keyvault_name =                                         ""


#Miscellaneus Settings
alteryx_address_space = 								"10.71.39.0/27"


#Network and Subnets
alteryx_address_space = 								""


#Secrets
client_secret =                                         ""
shared_state_storage_account_access_key = 				""
sqlserveradmin_password =								""
vmpassword = 											""


#Shared State Configuration
shared_state_storage_account_blob_key_name = 			"iac-acc-spi.stg.tfstate"
shared_state_storage_account_container_name =			"terraformstatecontainer"
shared_state_storage_account_name = 					"stocoeusazcop9e27f52cprd"


#Targets
application_name =										"alteryx"
application_rg_location =                               "eastus"
deployment_environment = 								"stg"

location_acronym =    "use"
application_acronym = "spi"
environment_acronym = "stg"

#Virtual Machines
UEMCALTERYX1P1_name =                                   "VMWUSEALTERYX1STG"
os_name             =                                   "VMWALTERYX1STG"

UEMCALTERYX1P1_vm_size =                                "Standard_D2s_v3"
wkstn_vm_image_id = 									"/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

restrict_gateway_endpoint = "false"