tenant_id                              = "188697ab-840f-44ec-8535-aaaa5680bab0"
subscription_id                        = "adf88b05-d3d7-4dee-ba30-ea939f9a1b1c"
client_id                              = "76ea9629-a4e1-4a9a-ba2f-39840e53342a"
client_secret                          = ""

location                               = "eastus"
location_acronym                       = "use"
environment                            = "qa"
environment_acronym                    = "qa"
application_acronym                    = "spi"
application_rs                         = "rstudio"
globalunique                           = "qrx"
PaloAltoInboundIP                      = "10.30.16.101"
wkstn_vm_image_id                      = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-WRKST-VERSION-4-20181017123641"
wkstn1_vm_image_id                     = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-WKSTN-Version-3-20180927084549"
apdb_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-APPDB-Verion-1-20180921124819"
gn_vm_image_id                         = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-REPGN-Verion-2-20181017124608"
fish_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-FISH-Verion-1-20180921124819"
sql_vm_image_id                        = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-PRODSQL-Verion-2-20181017132228"
web_vm_image_id                        = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-WEB-Verion-1-20180921124819"
srvr_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-SSAS-Verion-1-20180921124819"
ssas_vm_image_id                       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/SPI-SSAS-Verion-2-20181017131930"
recoveryServicesVaultName				= "rsv-use-da-qa"
recoveryServicesVaultResourceGroupName	= "RGP-USE-DA-BACKUPRECOVERY-QA"

tags = {
	Environment  	= "QA"
	LOB             = "Deal Advisory & Strategy"
	Node            = "Spoke"
	Platform        = "Azure Commercial Cloud"
	Solution        = "Strategic Profitability Insights (SPI)"
	BusinessContact = "adamwerner@kpmg.com"
	BusinessOwner   = "Adam S Werner"
}

tags_rs = {
	Environment 	= "QA"
	LOB             = "Deal Advisory & Strategy"
	Node            = "Spoke"
	Platform        = "Azure Commercial Cloud"
	Solution        = "RStudio"
	BusinessContact = "tschenk@kpmg.com"
	BusinessOwner   = "Tom Schenk"
}

tags_cons = {
    Environment     = "QA"
    LOB             = "Consulting"
    Node            = "Spoke"
    Platform        = "Azure Commercial Cloud"
    Solution        = "Strategic Profitability Insights (SPI)"
    BusinessContact = "jameswilson@kpmg.com"
    BusinessOwner   = "James Duffy Wilson"
    Datadog         = "Monitored"
}

#ApplicationGateway Variables
environment_acronym_agw                    = "qa"
AppGatewaycertpassword                    = ""
spivnet_address_space                     = "10.71.32.0/21"
subnet_address_space_infra1               = "10.71.33.0/26"
subnet_address_space_appgw                = "10.71.32.64/26"
subnet_address_space_app1                 = "10.71.35.0/24"
subnet_address_space_db1                  = "10.71.36.0/24"
subnet_address_space_bstn                 = "10.71.37.0/24"
subnet_address_space_GatewaySubnet        = "10.71.39.192/26"
subnet_address_space_ase1                 = "10.71.32.128/25"
subnet_address_space_spirstudioSubnet     = "10.71.33.128/27"
subnet_address_space_web1                 = "10.71.34.0/24"
subnet_address_space_pe                   = "10.71.39.32/27"
dns_servers_ip_hub_AADS                   = ["10.1.11.4","10.1.11.5"]
appgateway_sku                            = "WAF_Medium"
SPIvmpassword                             = ""
UEMCSPIWKSTN_vm_size                      = "Standard_D4s_v3"
wkstnvm_count                             = "3"
wkst_v5_count                             = "1"
spiwsp13_index							  = -1
spiwsp16_index							  = -1
wkstn_machine_disk_type                   = "Standard_LRS"
wkstn_machine_disk_type_premium           = "Premium_LRS"
wkstn_machine_disk_size                   = "512"
UEMCSPIAPDB1P_vm_size                     = "Standard_D4s_v3"
UEMCSPIAPDB1P_vm_count                    = "1"
UEMCSPIAPDB1P_disk_type                   = "Standard_LRS"
UEMCSPIREPGN_vm_size                      = "Standard_D4s_v3"
UEMCSPIREPGN_vm_count                     = "1"
UEMCSPIPRODSQL_vm_type                    = "Standard_D4s_v3"
UEMCSPISRVR_vm_type                       = "Standard_D4s_v3"
UEMCSPISSAS_vm_type                       = "Standard_D4s_v3"
fish_vm_size                              = "Standard_D4s_v3"
prodsql2_vm_size                          = "Standard_D4s_v3"
ssis_vm_size                              = "Standard_D4s_v3"

#Azure Firewall Variables
firewall_network_name                     = "fwl-use-primary-qa-core"
firewall_network_rg_name                  = "RGP-USE-COREVNET-QA"
azure_firewall_subscription_id            = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"

#DA Fileshare Size Variables
spishare_size 					           = "100"
fddshare_size 					           = "100"
install_size 					           = "100"
alteryxdata_size							= "100"



spirest                                    ="spirestqa"
app_gateway_environment_acronym			   ="qa"

spisslcert 									="spi.kpmgcloudops.com.cer"
spisslcertpfx								="spi.kpmgcloudops.com.pfx"
spirestsslcert								="spirestqa.kpmgcloudops.com.cer"
spirestsslcertpfx							="spirestqa.kpmgcloudops.com.pfx"

#Virtual Network Peering
coresubscriptionid                                  = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid                               = "25f8d797-bee2-4a88-84cc-de328abd6731"
newcoresubscriptionid                               = "5ce45d57-3192-4bfe-9c2f-cb567b30c586"
corevnetresourcegroup                               = "co-np-eastus-core1-rg"
transitvnetresourcegroup                            = "CO-NP-eastus-CONPTVnet-rg"
newcorevnetresourcegroup                            = "RGP-USE-COREVNET-QA"
corevnetname                                        = "co-np-eastus-core1-vnet"
transitvnetname                                     = "CO-NP-eastus-transit1-Vnet"
newcorevnetname                                     = "vnt-use-core-qa"

# NSG Rule IP's
az_fw_public_ips            			   = ["40.76.169.86/32","40.76.168.231/32","40.76.169.36/32","40.76.169.44/32","40.76.169.103/32"]
ASE_PIP                                    = ["52.147.199.75/32"]
KIPAGW_PIP								   = ["52.152.171.172/32"]

azfirewall_private_ip_address				 = "10.101.2.196"

pvt_dns_subscription_id            = "c72acede-d539-45d9-963d-3464ec4ddae0"
pvt_dns_resource_group             = "rgp-use-core-private-dnszone-dv"

#Arcgis Dev Pep_subent
gis_vnet_name    = "vnt-use-arcgis-qa"
gis_vnet_rg_name = "RGP-USE-ARCGIS-QA"
pep_subnet_name  = "sub-use-arcgis-pep-qa"