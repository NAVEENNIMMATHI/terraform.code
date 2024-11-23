subscription_id =                                       "b75fc3c3-04a4-45a6-b126-8279f505e873"
client_id =                                             "c0826099-5dc0-42fd-8d70-876ff8472f22"
tenant_id =                                             "b5031e57-d76f-422e-87c6-02b4cc749974"

tags = {
	BusinessContact = 									"dkosowsky@kpmg.com"
	BusinessOwner = 									"Dovid S Kosowsky"
	Environment = 										"UAT"
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
shared_state_storage_account_blob_key_name = 			"iac-acc-spi.uat.tfstate"
shared_state_storage_account_container_name =			"terraformstatecontainer"
shared_state_storage_account_name = 					"stousecommonb75fc3c3"

#Targets
application_name =										"tableau"
application_rg_location =                               "eastus"
deployment_environment = 								"uat"

environment = 								            "uat"

location_acronym =                                      "use"
application_acronym =                                   "tab"
application_acronym_spi =                               "spi"
environment_acronym =                                   "ut"
environment_acronym_aad_app =                           "uat"

tabappgw_address_space =                                "10.51.33.64/27"
tabext_address_space =                                  "10.51.33.128/26"

spi_web_subnet_address_space =                          "10.51.34.0/24"
spi_app_subnet_address_space =                          "10.51.35.0/24"

route_table_name =                                      "rtb-use-spi-azfirewall-uat"
route_table_rg_name =                                   "RGP-USE-SPI-VNET-UAT"

appgateway_sku =                                        "WAF_v2"
AppGatewaycertpassword =                                ""

tableau_server_vm_size =                                "Standard_E8s_v3"
tableau_server_vm_image_id =                            ""