client_id =                                             "e0628e55-2ee3-4131-8fdd-330265aed576"
subscription_id =                                       "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id =                                             "188697ab-840f-44ec-8535-aaaa5680bab0"

tags = {
	BusinessContact = 									"dkosowsky@kpmg.com"
	BusinessOwner = 									"Dovid S Kosowsky"
	Environment = 										"Development"
	LOB	= 												"Deal Advisory & Strategy"
	Node =  											"Spoke"
	Platform = 											"Azure Commercial Cloud"
	Solution = 											"Tableau"
    TagAutomationStatus =                               "Successful"
}

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
application_name =										"tableau"
application_rg_location =                               "eastus"
deployment_environment = 								"dv"

environment = 								            "development"

location_acronym =                                      "use"
application_acronym =                                   "tab"
application_acronym_spi =                               "spi"
environment_acronym =                                   "dv"
environment_acronym_aad_app =                           "dev"

tabappgw_address_space =                                "10.51.33.64/27"
tabext_address_space =                                  "10.51.33.128/26"

spi_web_subnet_address_space =                          "10.51.34.0/24"
spi_app_subnet_address_space =                          "10.51.35.0/24"

route_table_name =                                      "rtb-use-spi-azfirewall-dv"
route_table_rg_name =                                   "RGP-USE-SPI-VNET-DV"

appgateway_sku =                                        "WAF_v2"
AppGatewaycertpassword =                                ""

tableau_server_vm_size =                                "Standard_E8s_v3"
tableau_server_vm_image_id =                            ""