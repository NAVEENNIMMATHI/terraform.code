client_id       = "089028a6-c23d-4854-8ecf-2ed345a8b1bf"
subscription_id = "5d3ae075-2601-49d3-9223-892e3d7f6fb1"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"
client_secret   = ""

agent_subnet_id    = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet"
wvd_subnet_id      = "/subscriptions/37d718b4-71be-4555-bbcc-d275927e8b67/resourceGroups/RGP-USE-WVD-VNET-NP/providers/Microsoft.Network/virtualNetworks/vnet-use-wvd-np/subnets/sub-use-wvd-cope-np"
encryptapp_sp_name = "DiskEncryptApp"
spn_name           = "spn-devops-5d3ae075"
spoke_vnet_name    = "vnt-use-ase-pd"
spoke_vnet_rgname  = "RGP-USE-ASE-PD"
spoke_law_name          = "law-use-spokeapp-pd"
spoke_law_rg_name       = "rgp-use-ase-pd"

tags = {
  Environment = "Production"
  LOB         = "Consulting"
  Node        = "Spoke"
  Platform    = "Azure Commercial Cloud"
  Solution    = "MathWorks Inventory Platform (MIP)"
}

application_name = "MathWorks"

application_acronym           = "mip"
location_acronym              = "use"
location                      = "eastus"
environment_acronym           = "pd"
target_deployment_environment = "pd"
client                        = "stifel"
client_address_prefix         = "20.185.109.156/32"

# License Manager subnet
license_manager_acronym                        = "lms"
address_prefix                                 = "10.4.32.0/28"
enforce_private_link_endpoint_network_policies = false
service_endpoints                              = ["Microsoft.Storage", "Microsoft.Sql"]

# App Gateway subnet
address_prefix_agw                                 = "10.4.32.64/26"
enforce_private_link_endpoint_network_policies_agw = false
service_endpoints_agw                              = []

# AKS subnet
address_prefix_aks                                 = "10.4.36.0/22"
enforce_private_link_endpoint_network_policies_aks = true
service_endpoints_aks                              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.ContainerRegistry", "Microsoft.KeyVault"]

# Private Links subnet
address_prefix_pep                                 = "10.4.32.16/28"
enforce_private_link_endpoint_network_policies_pep = true
service_endpoints_pep                              = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.KeyVault"]

# AKS cluster
aks_version                = "1.21.9"
aks_default_node_pool_name = "agentpool"
aks_default_node_count     = "1" ### scale back up to 4
aks_default_node_size      = "Standard_D8s_v3"
aks_default_auto_scaling   = "false"
aks_default_pool_type      = "VirtualMachineScaleSets"
aks_default_avail_zones    = ["1"]
dns_vnet                   = "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet"
aks_lin_node_pool_name     = "mippool"
aks_lin_node_count         = "0" ### scale back up to 4
aks_lin_node_size          = "Standard_DS2_v2"
aks_lin_auto_scaling       = "false"
aks_lin_avail_zones        = ["1"]
aks_node_subscription      = "pd-spoke-application"

# Private DNS Zone
private_dns_zone_subscription            = "4c9dc048-01dc-4854-9063-8a3d4060993a" # pd-core
private_dns_zone_resource_group_name     = "RGP-USE-CORE-PRIVATE-DNSZONE-PD"
private_dns_zone_name_file               = "privatelink.file.core.windows.net"
private_dns_zone_name_automation_agensvc = "privatelink.agentsvc.azure-automation.net"
private_dns_zone_name_automation         = "privatelink.azure-automation.net"
private_dns_zone_name_vaultcore          = "privatelink.vaultcore.azure.net"
private_dns_zone_name_azurecr            = "privatelink.azurecr.io"
private_dns_zone_name_azmk8s             = "privatelink.eastus.azmk8s.io"
private_dns_zone_name_postgres           = "privatelink.postgres.database.azure.com"

# Route Table
azfwsubscriptionid       = "4c9dc048-01dc-4854-9063-8a3d4060993a"
firewall_network_name    = "firewall-primary-prod-hub"
firewall_network_rg_name = "CO-P-eastus-hubvnet-rg"

# Application Gateway
application_gateway = {
  environment_acronym = "pd"
  subnet_address      = "10.4.32.64/26"
  sku = {
    name     = "WAF_V2"
    tier     = "WAF_V2"
    capacity = 2
  }
}
backend_cer_cert_name  = "kpmgcloudops.com"
frontend_pfx_cert_name = "mip-stifel.kpmgcloudops.com"
application_gateway_cert_name = "stifel.mip.kpmgcloudops.com"
agw_pfx_cert_name = "stifel-mip-kpmgcloudops-com-pfx"

# This is temp workaround to pull the manually created secret from the keyvault. 
# We should fetch in data source, but I wonder if code will work if the actual keyvault has not been created yet during first time
# initialization
ssl_certificate_secret_id = "https://kvl-use-mip-stifel-dv.vault.azure.net/secrets/stifel-mipdev-kpmgcloudops-com-pfx/b1b90d0cdd95451887ea26287f085ec6"

# PostgresSql Database variables
mathworks_postgresql_sku_name                             = "GP_Gen5_4"
mathworks_postgresql_storageprofile_storage_mb            = "5120"
mathworks_postgresql_storageprofile_backup_retention_days = "30"
mathworks_postgresql_storageprofile_geo_redundant_backup  = "Disabled"
mathworks_postgresql_adminname                            = "kpmgmathworksdaadmin"
mathworks_postgresql_adminpassword                        = ""
mathworks_postgresql_PostGresVersion                      = "11"
mathworks_connect_postgresql_db_name                      = "pgd-use-mip-ui"
mathworks_connect_postgresql_db_api_name                  = "pgd-use-mip-api"
mathworks_connect_postgresql_db_config_name               = "pgd-use-mip-config"
mathworks_connect_postgresql_db_ui_name                   = "pgd-use-mip-ui-pd"
mathworks_connect_postgresql_db_content_name              = "pgd-use-mip-content-pd"

# License Manager Virtual Machine
vm_count_buildvm_license_manager = 1
vm_size_build                    = "Standard_D2s_v4"
mathworks_vm_admin_password      = ""

# Linux VM
mip_linuxvm_admin_password = ""
mip_linuxvm_adminname      = "mathworkslinadmin"
mip_linuxvm_count          = 1
mip_linuxvm_name_prefix1   = "LNX"
mip_linuxvm_size           = "Standard_D2s_v3" ##### scale back up to Standard_D4s_v3
vm_linux_image_id          = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/CIS-RedHat-Enterprise-Linux-75.vhd-image"

# #Recovery Services Vault
# recoveryServicesVaultName				= "rsv-use-spokeapp-dv"
# recoveryServicesVaultResourceGroupName	= "RGP-USE-SPOKEAPP-BACKUPRECOVERY-DV"

#IP Ranges
kpmg_trusted_address_prefixes = ["20.185.109.156/32", "54.173.33.56/32", "199.207.253.0/24", "20.185.106.213/32", "103.58.118.0/24", "199.206.0.5/32", "103.216.201.101/32"]
firewall_ip = "10.7.1.4"