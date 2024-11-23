#Auth Variables

tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
client_secret   = ""

#dministrator_login          = "kpmgfotdaadmin"
#administrator_login_password = ""

# Tags

tags = {
  Platform        = "Azure Commercial Cloud"
  Environment     = "UAT"
  Node            = "Spoke"
  Solution        = "Ethics and Compliance Case Management (ECCM)"
  LOB             = "Consulting"
  BusinessContact = "jleamon@kpmg.com"
  BusinessOwner   = "Jeffrey Leamon"
}

#Environment Variables
application_acronym           = "eccm"
location_acronym              = "use"
resource_location             = "eastus"
environment                   = "uat"
environment_acronym           = "uat"
application_name              = "eccm-app"

#Service Principle
devopsspn_service_principal_name = "spn-devops-104a6d25"
dev_spn = "5c096eac-2d18-4e0a-adf4-f356a6040ebb"

#Virtual Network 
spoke_vnet_name= "vnt-use-ase-uat"
spoke_vnet_rg_name = "RGP-USE-ASE-UAT"

#Subnet Variables
eccm_agw_subnet_address_prefix     = "10.50.85.0/25"
eccm_lap_pvt_subnet_address_prefix = "10.50.85.128/25"
eccm_lap_pub_subnet_address_prefix = "10.50.88.0/25"
eccm_pep_subnet_address_prefix     = "10.50.88.128/25"
eccm_css_subnet_address_prefix     = "10.50.89.0/25"
eccm_aks_subnet_address_prefix     = "10.50.92.0/25"
eccm_app_subnet_address_prefix     = "10.50.92.128/25"



#Route Table Variables
AzureFirewallIPAddress = "10.100.2.196"

#KMPG trusted IP range
kpmg_trusted_ip = ["20.185.109.156/32","103.216.201.101/32","54.173.33.56/32","199.207.253.0/24","20.185.106.213/32","199.206.0.5/32","103.58.118.0/24"]

#Secrets
eccm_sql_server_admin_password  = ""

# Private DNS Zone
private_dns_zone_subscription            = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name     = "rgp-use-core-private-dnszone-pd"
private_dns_zone_name_logic_app          = "privatelink.azurewebsites.net"   
private_dns_zone_name_blob               = "privatelink.blob.core.windows.net" 
private_dns_zone_name_table              = "privatelink.table.core.windows.net" 
private_dns_zone_name_queue              = "privatelink.queue.core.windows.net" 
private_dns_zone_name_logic_app_storage  = "privatelink.web.core.windows.net"
private_dns_zone_name_sql                = "privatelink.database.windows.net"
private_dns_zone_name_acr                = "privatelink.azurecr.io"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"

# AKS cluster
aks_version                = "1.25"
aks_default_node_pool_name = "agentpool"
aks_default_node_count     = "1"
aks_default_node_size      = "Standard_D8s_v3" 
aks_default_auto_scaling   = "false"
aks_default_pool_type      = "VirtualMachineScaleSets"
aks_default_avail_zones    = ["1"]
dns_vnet                   = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
aks_lin_node_pool_name     = "eccmpool"
aks_lin_node_count         = "0"
aks_lin_node_size          = "Standard_DS2_v2"
aks_lin_auto_scaling       = "false"
aks_lin_avail_zones        = ["1"]
aks_node_subscription      = "uat-spoke-application" 

##Public DNS variables
public_dns_domain            = "eccmservice-uat.kpmgcloudops.com"

# Application Gateway
application_gateway = {
  sku = {
	name     = "WAF_v2"
  tier     = "WAF_v2"
  capacity = 2
  }
}

#SSL Certificate
backend_cer_cert_name = "kpmgcloudops.com"
frontend_pfx_cert_name = "eccmservice-uat.kpmgcloudops.com"