tenant_id                              = "b5031e57-d76f-422e-87c6-02b4cc749974"
subscription_id                        = "b75fc3c3-04a4-45a6-b126-8279f505e873"
client_id                              = "9975dc86-7489-483c-b49c-47bdff5e2eb8"
client_secret                          = ""

location                               = "eastus"
location_acronym                       = "use"
environment                            = "uat"
environment_acronym                    = "uat"
application_acronym                    = "spi"
application_rs                         = "rstudio"
globalunique                           = ""
PaloAltoInboundIP                      = "10.30.16.100"
wkstn_vm_image_id                      = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-WRKST-VERSION-4-20181017123641"
wkstn1_vm_image_id                     = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-WKSTN-Version-3-20180927084549"
apdb_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-APPDB-Verion-1-20180921124819"
gn_vm_image_id                         = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-REPGN-Verion-2-20181017124608"
fish_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-FISH-Verion-1-20180921124819"
sql_vm_image_id                        = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-PRODSQL-Verion-2-20181017132228"
web_vm_image_id                        = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-WEB-Verion-1-20180921124819"
srvr_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-SSAS-Verion-1-20180921124819"
ssas_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-SSAS-Verion-2-20181017131930"
recoveryServicesVaultName				= "rsv-use-da-ut"
recoveryServicesVaultResourceGroupName	= "RGP-USE-DA-BACKUPRECOVERY-UT"

tags = {
	Environment  	= "UAT"
	LOB             = "Deal Advisory & Strategy"
	Node            = "Spoke"
	Platform        = "Azure Commercial Cloud"
	Solution        = "Strategic Profitability Insights (SPI)"
	BusinessContact = "adamwerner@kpmg.com"
	BusinessOwner   = "Adam S Werner"
}


tags_rs = {
	Environment 	= "UAT"
	LOB             = "Deal Advisory & Strategy"
	Node            = "Spoke"
	Platform        = "Azure Commercial Cloud"
	Solution        = "RStudio"
	BusinessContact = "tschenk@kpmg.com"
	BusinessOwner   = "Tom Schenk"
}
tags_cons = {
    Environment     = "UAT"
    LOB             = "Consulting"
    Node            = "Spoke"
    Platform        = "Azure Commercial Cloud"
    Solution        = "Strategic Profitability Insights (SPI)"
    BusinessContact = "jameswilson@kpmg.com" 
    BusinessOwner   = "James Duffy Wilson"
    Datadog         = "Monitored"
}

#ApplicationGateway Variables
environment_acronym_agw                    = "uat"
AppGatewaycertpassword                    = ""
spivnet_address_space                     = "10.51.32.0/21"
subnet_address_space_infra1               = "10.51.33.0/26"
subnet_address_space_appgw                = "10.51.32.64/26"
subnet_address_space_app1                 = "10.51.35.0/24"
subnet_address_space_db1                  = "10.51.36.0/24"
subnet_address_space_bstn                 = "10.51.37.0/24"
subnet_address_space_GatewaySubnet        = "10.51.39.192/26"
subnet_address_space_ase1                 = "10.51.32.128/25"
subnet_address_space_spirstudioSubnet     = "10.51.33.128/27"
subnet_address_space_web1                 = "10.51.34.0/24"
subnet_address_space_pe                   = "10.51.39.32/27"
dns_servers_ip_hub_AADS                   = ["10.30.15.197","10.30.15.196"]
appgateway_sku                            = "WAF_Medium"
SPIvmpassword                             = ""
UEMCSPIWKSTN_vm_size                      = "Standard_D4s_v3"
wkstnvm_count                             = "3"
wkst_v5_count							  = "1"
spiwsp13_index							  = -1
spiwsp16_index							  = -1
wkstn_machine_disk_type                   = "Standard_LRS"
wkstn_machine_disk_type_premium           = "Premium_LRS"
wkstn_machine_disk_size                   = "512"
UEMCSPIAPDB1P_vm_size                     = "Standard_F32s_v2"
UEMCSPIAPDB1P_vm_count                    = "1"
UEMCSPIAPDB1P_disk_type                   = "Standard_LRS"
UEMCSPIREPGN_vm_size                      = "Standard_E8s_v3"
UEMCSPIREPGN_vm_count                     = "6"
UEMCSPIPRODSQL_vm_type                    = "Standard_E64is_v3"
UEMCSPISRVR_vm_type                       = "Standard_DS13_v2"
UEMCSPISSAS_vm_type                       = "Standard_E64is_v3"
fish_vm_size                              = "Standard_D16s_v3"
prodsql2_vm_size                          = "Standard_E32s_v3"
ssis_vm_size                              = "Standard_E64is_v3"

#Azure Firewall Variables
firewall_network_name                     = "fwl-use-primary-uat-core"
firewall_network_rg_name                  = "RGP-USE-COREVNET-UAT"
azure_firewall_subscription_id            = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"

#DA Fileshare Size Variables
spishare_size 					           = "100"
fddshare_size 					           = "100"
install_size 					           = "100"
alteryxdata_size							= "100"


spirest                                    ="spirestuat"
app_gateway_environment_acronym			   ="uat"

spisslcert 									="spi.kpmgcloudops.com.cer"
spisslcertpfx								="spi.kpmgcloudops.com.pfx"
spirestsslcert								="spirestuat.kpmgcloudops.com.cer"
spirestsslcertpfx							="spirestuat.kpmgcloudops.com.pfx"

#Virtual Network Peering
coresubscriptionid                                  = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid                               = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
newcoresubscriptionid                               = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
corevnetresourcegroup                               = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup                            = "CO-P-eastus-transitvnet-rg"
newcorevnetresourcegroup                            = "RGP-USE-COREVNET-UAT"
corevnetname                                        = "CO-P-eastus-hub-vnet"
transitvnetname                                     = "CO-P-eastus-transit-vnet"
newcorevnetname                                     = "vnt-use-core-uat"

# NSG Rule IP's
az_fw_public_ips             			   = ["52.170.175.39/32","52.170.174.246/32","52.188.26.32/32","52.188.27.2/32","52.188.26.99/32"]
ASE_PIP                                    = ["13.68.253.81/32"]
KIPAGW_PIP								   = ["52.224.104.52/32"]

azfirewall_private_ip_address				 = "10.100.2.196"

pvt_dns_subscription_id            = "4c9dc048-01dc-4854-9063-8a3d4060993a"
pvt_dns_resource_group             = "rgp-use-core-private-dnszone-pd"

#Arcgis Dev Pep_subent
gis_vnet_name    = "vnt-use-arcgis-uat"
gis_vnet_rg_name = "RGP-USE-ARCGIS-UAT"
pep_subnet_name  = "sub-use-arcgis-pep-uat"