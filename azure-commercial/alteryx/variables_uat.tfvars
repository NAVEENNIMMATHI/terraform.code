subscription_id = "b75fc3c3-04a4-45a6-b126-8279f505e873"
client_id       = "c0826099-5dc0-42fd-8d70-876ff8472f22"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

tags = {
	BusinessContact = 									"johair@KPMG.com"
	BusinessOwner = 									"Joel O'Hair"
	Environment = 										"UAT"
	LOB	= 												"Deal Advisory & Strategy"
	Node =  											"Spoke"
	Platform = 											"Azure Commercial Cloud"
	Solution = 											"Alteryx"
}


#Database Configuration
sql_server_admin_username =								"sqladmin"
sql_server_version =									"12.0"


#Key Vaults
keyvault_admin_group_name =                             "CO-TerraformStorage-Admin"
keyvault_name =                                         "couatkeyv01alteryx"


#Miscellaneus Settings
uniqueresourcesuffix = 									"uat"


#Network and Subnets
alteryx_address_space = 								"10.51.39.0/27"


#Secrets
client_secret =                                         ""
shared_state_storage_account_access_key = 				""
sqlserveradmin_password =								""
vmpassword = 											""


#Shared State Configuration
shared_state_storage_account_blob_key_name = 			"iac-acc-spi.uat.tfstate"
shared_state_storage_account_container_name =			"terraformstatecontainer"
shared_state_storage_account_name = 					"stousecommonb75fc3c3"


#Targets
application_name =										"alteryx"
application_rg_location =                               "eastus"
deployment_environment = 								"uat"

location_acronym =    "use"
application_acronym = "spi"
environment_acronym = "uat"

#Virtual Machines
UEMCALTERYX1P1_name =                                   "VMWUSEALTERYX1UAT"
UEMCALTERYX1P1_vm_size =                                "Standard_D2s_v3"

UEMCALTERYX1P1_name =                                   "VMWUSEALTERYX1UAT"
os_name             =                                   "VMWALTERYX1UAT"

wkstn_vm_image_id = 									"/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

restrict_gateway_endpoint = "false"