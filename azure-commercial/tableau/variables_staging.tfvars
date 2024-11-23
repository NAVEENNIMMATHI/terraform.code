client_id =                                             "b2967f11-d801-4812-b532-3f3a676e8b46"
subscription_id =                                       "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id =                                             "b5031e57-d76f-422e-87c6-02b4cc749974"

tags = {
	BusinessContact = 									"dkosowsky@kpmg.com"
	BusinessOwner = 									"Dovid S Kosowsky"
	Environment = 										"Staging"
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
shared_state_storage_account_blob_key_name = 			"iac-acc-spi.stg.tfstate"
shared_state_storage_account_container_name =			"terraformstatecontainer"
shared_state_storage_account_name = 					"stocoeusazcop9e27f52cprd"

#Targets
application_name =										"tableau"
application_rg_location =                               "eastus"
deployment_environment = 								"stg"

environment = 								            "staging"

location_acronym =                                      "use"
application_acronym =                                   "tab"
application_acronym_spi =                               "spi"
environment_acronym =                                   "st"
environment_acronym_aad_app =                           "stg"

tabappgw_address_space =                                "10.71.1.64/27"
tabext_address_space =                                  "10.71.1.128/26"

spi_web_subnet_address_space =                          "10.71.2.0/24"
spi_app_subnet_address_space =                          "10.71.3.0/24"

route_table_name =                                      "rtb-use-spi-azfirewall-stg"
route_table_rg_name =                                   "RGP-USE-SPI-VNET-STG"

appgateway_sku =                                        "WAF_v2"
AppGatewaycertpassword =                                ""

tableau_server_vm_size =                                "Standard_E8s_v3"
tableau_server_vm_image_id =                            ""