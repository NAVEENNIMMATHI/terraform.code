client_id           										= "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret       										= ""
subscription_id     										= "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id           									    = "b5031e57-d76f-422e-87c6-02b4cc749974"

tags = {
	Environment 											= "Production"
	LOB														= "Deal Advisory & Strategy"
	Node 													= "Spoke"
	Platform 												= "Azure Commercial Cloud"
	Solution 												= "Power BI"
	BusinessContact 										= "jspaletto@kpmg.com"
	BusinessOwner 											= "Judy Spaletto"
	Datadog                                                 = "Monitored"
}
location                                    				= "eastus"
location_acronym											= "use"
vm_image_id                                                 = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"
wkstn_vm_image_id                                           = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-PowerBI-20190701-image"
tableau_vm_image_id                                         = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-PowerBI-tableau-20190701-image"
environment					                                = "production"
application_acronym                                         = "pbi"
application_acronym_spi										= "spi"
application													= "powerbi"
vmpassword                                                  = ""
environment_acronym											= "p"


UEMCPBIGTW1P1_vm_size                                       = "Standard_D8s_v3"
UEMCPBIGTW2P1_vm_size                                       = "Standard_D8s_v3"
UEMCSPIWST1P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST1P6_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST2P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST2P6_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST3P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST3P6_vm_size                                       = "Standard_D4s_v3"
UEMCSPIWST4P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST4P6_vm_size                                       = "Standard_D4s_v3"
UEMCSPIWST5P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST5P6_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST6P5_vm_size                                       = "Standard_D4s_v3"
UEMCSPIWST7P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST8P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST9P5_vm_size                                       = "Standard_D16s_v3"
UEMCSPIWST10P5_vm_size                                      = "Standard_D16s_v3"

shared_state_storage_account_name                           = "stocoeusazcop9e27f52cprd"
shared_state_storage_account_container_name                 = "terraformstatecontainer"
shared_state_storage_account_blob_key_name                  = "iac-acc-spi.pd.tfstate"
shared_state_storage_account_access_key                     = ""