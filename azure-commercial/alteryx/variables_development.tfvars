client_id =                                             "e0628e55-2ee3-4131-8fdd-330265aed576"
subscription_id =                                       "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id =                                             "188697ab-840f-44ec-8535-aaaa5680bab0"

tags = {
	BusinessContact = 									"johair@KPMG.com"
	BusinessOwner = 									"Joel O'Hair"
	Environment = 										"Development"
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
keyvault_name =                                         "codvkeyv01alteryx"


#Miscellaneus Settings
uniqueresourcesuffix = 									"dv"


#Network and Subnets
alteryx_address_space = 								"10.51.39.0/27"


#Secrets
client_secret =                                         ""
shared_state_storage_account_access_key = 				""
sqlserveradmin_password =								""
vmpassword = 											""


#Shared State Configuration
shared_state_storage_account_blob_key_name = 			"iac-acc-spi.dv.tfstate"
shared_state_storage_account_container_name =			"terraformstatecontainer"
shared_state_storage_account_name = 					"stousecommon3507153c"


#Targets
application_name =										"alteryx"
application_rg_location =                               "eastus"
deployment_environment = 								"dv"


location_acronym =    "use"
application_acronym = "spi"
environment_acronym = "dv"

#Virtual Machines
os_name             =                                   "VMWALTERYX1DV"
UEMCALTERYX1P1_name =                                   "VMWUSEALTERYX1DV"
UEMCALTERYX1P1_vm_size =                                "Standard_D2s_v3"

wkstn_vm_image_id = 									"/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

route_table_name             = "rtb-use-spi-azfirewall-dv"
route_table_rg_name          = "RGP-USE-SPI-VNET-DV"

restrict_gateway_endpoint = "false"

