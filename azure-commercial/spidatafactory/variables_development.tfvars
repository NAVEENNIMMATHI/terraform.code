subscription_id = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
client_id       = "e0628e55-2ee3-4131-8fdd-330265aed576"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

#Secrets
admin_password = ""
client_secret  = ""


tags = {
    TagAutomationStatus =			 "Successful"
	BusinessOwner 		=			 "Tom Schenk"
	Platform 			=			 "Azure Commercial Cloud"
	Node 				=            "Spoke"
	LOB					=            "Deal Advisory & Strategy"
	Environment 		=            "Development"
	BusinessContact 	=            "tschenk@kpmg.com"
	Solution 			=             "Databricks"
}


tags_rg = {}
tags_sto= {}
tags_vm = {}


tags_diag = {
	EngagementCode = "403000002065"
	CostCenter  = ""
	OwnerContact = "jspaletto@kpmg.com"
	Owner = "Spaletto, Judi L"
	TagAutomationStatus = "Successful"
	ApplicationName     = "SPI" 
    BusinessContact    = "adamwerner@kpmg.com" 
    BusinessOwner       = "Adam S Werner" 
	Platform           = "Azure Commercial Cloud" 
    Solution            = "Strategic Profitability Insights (SPI)" 
	Environment         = "Production" 
    LOB              = "Deal Advisory & Strategy" 
    Node             = "Spoke" 

}


loganalyticsresourcegroupname = "RGP-USE-SPI-LOGANALYTICS-DV"
location                    = "eastus"
location_acronym            = "use"
environment                 = ""
environment_acronym         = "dev"
application_acronym         = "spi"
application_datafactory     = "factory"
application_datalake        = "lakestore"


controlplanesubnet = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-dtbr-controlplane-dv"
databrickssubnet   = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-dtbr-webapp-dv"
datafactorysubnet  = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-dtbr-webapp-dv"
spiappsubnet       = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-app-dv"
kipadfsubnet       = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-KIP-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-kip-dv/subnets/sub-use-adf-dv"
bastion1subnet     = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-bastion-dv"
spiappgwsubnet     = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-appgw-dv"
spiase1subnet      = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-ase-dv"
spidb1subnet       = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-db-dv"
spitabextsubnet    = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-tabext-dv"
spiweb1subnet      = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/sub-use-spi-web-dv"
gatewaysubnet      = "/subscriptions/3507153c-e6a4-4e2f-ae04-f34c1fd4482f/resourceGroups/RGP-USE-SPI-VNET-DV/providers/Microsoft.Network/virtualNetworks/vnt-use-spi-dv/subnets/GatewaySubnet"


CO-P-eastus-cospiloganalytics-rg = "RGP-USE-SPI-LOGANALYTICS-DV"

UEMCDATAFACTORYVM_vm_size = "Standard_D8s_v3"

 df_machine_disk_type = "Standard_LRS"
 df_machine_disk_size = 200
 df_vm_count =1
 df_vm_image_id = ""
 data_disk_count = 2
 

 