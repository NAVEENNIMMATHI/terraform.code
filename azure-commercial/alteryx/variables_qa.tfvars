subscription_id 								= "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
client_id       								= "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
tenant_id       								= "188697ab-840f-44ec-8535-aaaa5680bab0"

tags = {
	BusinessContact = 									"johair@KPMG.com"
	BusinessOwner = 									"Joel O'Hair"
	Environment = 										"QA"
	LOB	= 												"Deal Advisory & Strategy"
	Node =  											"Spoke"
	Platform = 											"Azure Commercial Cloud"
	Solution = 											"Alteryx"
}


#Database Configuration
sql_server_admin_username =								"sqladmin"
sql_server_version =									"12.0"


#Key Vaults
keyvault_admin_group_name =                             "CO-KeyVault-Admin"
keyvault_name =                                         "coqakeyv01alteryx"


#Miscellaneus Settings
uniqueresourcesuffix = 									"qa"


#Network and Subnets
alteryx_address_space = 								"10.71.39.0/27"


#Secrets
client_secret =                                         ""
shared_state_storage_account_access_key = 				""
sqlserveradmin_password =								""
vmpassword = 											""


#Shared State Configuration
shared_state_storage_account_blob_key_name = 			"iac-acc-spi.qa.tfstate"
shared_state_storage_account_container_name =			"terraformstatecontainer"
shared_state_storage_account_name = 					"stousecommonadf88b05"


#Targets
application_name =										"alteryx"
application_rg_location =                               "eastus"
deployment_environment = 								"qa"

location_acronym =    "use"
application_acronym = "spi"
environment_acronym = "qa"

#Virtual Machines
UEMCALTERYX1P1_name =                                   "VMWUSEALTERYX1QA"
os_name             =                                   "VMWALTERYX1QA"
UEMCALTERYX1P1_vm_size =                                "Standard_D2s_v3"
wkstn_vm_image_id = 									"/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

route_table_name             = "rtb-use-spi-azfirewall-qa"
route_table_rg_name          = "RGP-USE-SPI-VNET-QA"

restrict_gateway_endpoint = "false"