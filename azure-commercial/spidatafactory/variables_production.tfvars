subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

#Secrets
client_secret   = ""
admin_password  = ""
#resourceGroups
loganalyticsresourcegroupname = "CO-P-eastus-cospiloganalytics-rg"

tags_rg = {
    TagAutomationStatus = "Successful"
	BusinessOwner       = "Tom Schenk"
	Platform            = "Azure Commercial Cloud"
	Node                =  "Spoke"
	LOB	                =  "Deal Advisory & Strategy"
	Environment         =  "Production"
	BusinessContact     =  "tschenk@kpmg.com"
	Solution            =  "Databricks"
}
tags_sto= {
	ApplicationName    = "Dbricks"
    BusinessContact    = "tschenk@kpmg.com"
    BusinessOwner      = "Tom Schenk"
    CostCenter         = "na"
    Environment        = "Production"
    LOB                = "Deal Advisory & Strategy"
    Node               = "Spoke"
    Owner              = "na"
    OwnerContact       = "na"
    Platform           = "Azure Commercial Cloud"
    Solution           = "Databricks"
    TagAutomationStatus= "Successful"

}

tags_diag = {
	EngagementCode      = "403000002065"
	CostCenter          = ""
	OwnerContact        = "jspaletto@kpmg.com"
	Owner               = "Spaletto, Judi L"
	TagAutomationStatus = "Successful"
	ApplicationName     = "SPI" 
    BusinessContact     = "adamwerner@kpmg.com" 
    BusinessOwner       = "Adam S Werner" 
	Platform            = "Azure Commercial Cloud" 
    Solution            = "Strategic Profitability Insights (SPI)" 
	Environment         = "Production" 
    LOB                 = "Deal Advisory & Strategy" 
    Node                = "Spoke" 

}

tags_vm = {
	ApplicationName     = "Dbricks"
    BusinessContact     = "tschenk@kpmg.com"
    BusinessOwner       = "Tom Schenk"
    CostCenter          = "" 
    Environment         = "Production"
    LOB                 = "Deal Advisory & Strategy"
    Node                = "Spoke"
    Owner               = "" 
    OwnerContact        = "" 
    Platform            = "Azure Commercial Cloud"
    Solution            = "Databricks"
    TagAutomationStatus = "Successful"

}

tags = {
    TagAutomationStatus = "Successful"
	BusinessOwner 		= "Tom Schenk"
	Platform 			= "Azure Commercial Cloud"
	Node 				= "Spoke"
	LOB					= "Deal Advisory & Strategy"
	Environment 		= "Development"
	BusinessContact 	= "tschenk@kpmg.com"
	Solution 			= "Databricks"
    Datadog             = "Monitored"
}



location                 = "eastus"
location_acronym         = "use"
environment              = "production"
environment_acronym      = "p"
application_acronym      = "spi"
application_datalake     = "lakestore"
application_datafactory  = "factory"

controlplanesubnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spi-databricks-controlplane-subnet"
databrickssubnet   = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spi-databricks-webapp-subnet"
datafactorysubnet  = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spi-datafactory-subnet"
spiappsubnet       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiapp1-subnet"
kipadfsubnet       = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/co-pd-eastus-kip-rg/providers/Microsoft.Network/virtualNetworks/co-pd-eastus-kip-vnet/subnets/sub-use-adf-pd"
bastion1subnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spi-bastion1-subnet"
spiappgwsubnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiappgw-subnet"
spiase1subnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiase1-subnet"
spidb1subnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spidb1-subnet"
spitabextsubnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spitabext-subnet"
spiweb1subnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/co-p-eastus-spiweb1-subnet"
gatewaysubnet = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-spi-vnet/subnets/GatewaySubnet"

UEMCDATAFACTORYVM_vm_size = "Standard_D8s_v3"

df_machine_disk_type = "Standard_LRS"
df_machine_disk_size = 200
df_vm_count =2 

df_vm_image_id = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

data_disk_count = 2