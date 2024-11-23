subscription_id =								        "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
client_id =      								        "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
tenant_id =      								        "188697ab-840f-44ec-8535-aaaa5680bab0"

tags = {
	BusinessContact = 									"dkosowsky@kpmg.com"
	BusinessOwner = 									"Dovid S Kosowsky"
	Environment = 										"QA"
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
shared_state_storage_account_blob_key_name = 			"iac-acc-spi.qa.tfstate"
shared_state_storage_account_container_name =			"terraformstatecontainer"
shared_state_storage_account_name = 					"stousecommonadf88b05"

#Targets
application_name =										"tableau"
application_rg_location =                               "eastus"
deployment_environment = 								"qa"

environment = 								            "qa"

location_acronym =                                      "use"
application_acronym =                                   "tab"
application_acronym_spi =                               "spi"
environment_acronym =                                   "qa"
environment_acronym_aad_app =                           "qa"

tabappgw_address_space =                                "10.71.33.64/27"
tabext_address_space =                                  "10.71.33.128/26"

spi_web_subnet_address_space =                          "10.71.34.0/24"
spi_app_subnet_address_space =                          "10.71.35.0/24"

route_table_name =                                      "rtb-use-spi-azfirewall-qa"
route_table_rg_name =                                   "RGP-USE-SPI-VNET-QA"

appgateway_sku =                                        "WAF_v2"
AppGatewaycertpassword =                                ""

tableau_server_vm_size =                                "Standard_E8s_v3"
tableau_server_vm_image_id =                            ""