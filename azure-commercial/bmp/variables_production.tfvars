client_id       = "b2967f11-d801-4812-b532-3f3a676e8b46"
client_secret   = ""
subscription_id = "9e27f52c-3c97-4fda-9c8f-eadcd0ad195a"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

environment                     = "production"
environment_acronym             = "pd"
environment_acronym2            = "pd"
environment_acronym_ad_app      = ""
location_acronym                = "use"
location                        = "eastus"
application_acronym             = "bmp"
app_gateway_environment_acronym = ""
app_gateway_environment_acronym2 = ""

tags = {
  Platform    = "Azure Commercial Cloud"
  Environment = "Production"
  Node        = "Spoke"
  Solution    = "Benchmarking Plus (BMP)"
  LOB         = "Deal Advisory & Strategy"
  Datadog     = "Monitored"
}

# Network Security Groups Variables
bmpdb1_subnet_adress_space = "10.26.0.128/26"

# Virtual Network Variables
subnet_name_agw_address_space  = ["10.26.1.0/27"]
subnet_name_app_address_space  = ["10.26.0.0/26"]
subnet_name_api_address_space  = ["10.26.0.224/27"]
subnet_name_rest_address_space = ["10.26.0.64/26"]
subnet_name_info_address_space = ["10.26.0.192/27"]
subnet_name_db_address_space   = ["10.26.0.128/26"]
subnet_name_ase_address_space  = ["10.26.43.0/26"] #ase
subnet_name_pe_address_space   = ["10.26.43.64/27"] #pe

# Virtual Machine Count Variables
count_value_bmpapp1vm        = 3
count_value_bmprest1vm       = 4
count_value_bmpappvm_module  = 1
count_value_bmprestvm_module = 1
count_value_bmpinfovm_module = 1
count_value_bmpkpimvm_module = 1
vmsize_app                   = "Standard_D16s_v3"
vmsize_rest                  = "Standard_D16s_v3"
vmsize_info                  = "Standard_D16s_v3"
vmsize_kpi                   = "Standard_D4s_v3"

# Domain Variables
domain_name          = "kco.local"
ou_path              = "OU=AADDC Computers,DC=kco,DC=local"
domain_user_name     = "a-roshanpatel"
domain_user_password = ""

# Disk Encryption Variables
encryptappsp_key_password = ""

# BMP SQL UDR (Route Table) variable
dns_server = [
  "10.30.15.197",
  "10.30.15.196"
]
address_space = [
  "10.26.0.0/24",
  "10.26.1.0/24",
  "10.26.43.0/24"
]
custom_emails  = "go-fmmanagedservices@kpmg.com"
admin_password = ""

# Application Gateway Variables
app_gw_sku_name     = "WAF_Medium"
app_gw_sku_tier     = "WAF"
app_gw_sku_capacity = "2"

appcertpwd     = ""
kpimcertpwd    = ""
restcertpwd    = ""
meprestcertpwd = ""
mepcertpwd     = ""
dascertpwd     = ""
dasrestcertpwd = ""
dashcertpwd    = ""
actcertpwd     = ""

backupmanagement_service_principal_name = "Backup Management Service"
encryptapp_service_principal_name       = "DiskEncryptApp"
cloudops_keyvault_admin_group_name      = "CO-TerraformStorage-Admin"

network_rule_default_action = "Allow"
platform_fault_domain_count = 2
azurerm_image_id            = "/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourceGroups/CO-P-eastus-cospivmimage-rg/providers/Microsoft.Compute/images/cis-hardened-win2016-20190111-image"

#SPI
spi_log_analytics_workspace_name    = "co-p-eastus-cospi1-workspace"
spi_log_analytics_workspace_rg_name = "co-p-eastus-cospiloganalytics-rg"

#Azure Firewall Private IP
azfirewall_ip_address = "10.30.3.4"

#PaloAlto Firewall Details
paloalto_route_table_name    = "co-p-eastus-spitoPaloAlto-udr"
paloalto_route_table_rg_name = "CO-P-eastus-cospivnet-rg"

#Virtual Network Peering
coresubscriptionid       = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid    = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
newcoresubscriptionid    = "4c9dc048-01dc-4854-9063-8a3d4060993a"
corevnetresourcegroup    = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup = "CO-P-eastus-transitvnet-rg"
newcorevnetresourcegroup = "CO-P-eastus-hubvnet-rg"
corevnetname             = "CO-P-eastus-hub-vnet"
transitvnetname          = "CO-P-eastus-transit-vnet"
newcorevnetname          = "CO-P-eastus-hub-vnet"

authentication_certificates = [
  {
    certname    = "bmp_kpmgcloudops_com",
    authcertcer = "bmp.kpmgcloudops.com.cer"
  },
  {
    certname    = "bmpkpim_kpmgcloudops_com",
    authcertcer = "bmpkpim.kpmgcloudops.com.cer"
  },
  {
    certname    = "bmprest_kpmgcloudops_com",
    authcertcer = "bmprest.kpmgcloudops.com.cer"
  },
  {
    certname    = "meprest_kpmgcloudops_com",
    authcertcer = "meprest.kpmgcloudops.com.cer"
  },
  {
    certname    = "mep_kpmgcloudops_com",
    authcertcer = "mep.kpmgcloudops.com.cer"
  },
  {
    certname    = "das_kpmgcloudops_com",
    authcertcer = "das.kpmgcloudops.com.cer"
  },
  {
    certname    = "dasrest_kpmgcloudops_com",
    authcertcer = "dasrest.kpmgcloudops.com.cer"
  },
  {
    certname    = "dash_kpmgcloudops_com",
    authcertcer = "dash.kpmgcloudops.com.cer"
  },
  {
    certname    = "act_kpmgcloudops_com",
    authcertcer = "act.kpmgcloudops.com.cer"
  },
  {
    certname    = "star_kpmgcloudops_com",
    authcertcer = "star.kpmgcloudops.com.cer"
  }
]

ssl_certificates = [
  {
    certname   = "bmp_kpmgcloudops_com",
    sslcertpfx = "bmp.kpmgcloudops.com.pfx"
  },
  {
    certname   = "bmpkpim_kpmgcloudops_com",
    sslcertpfx = "bmpkpim.kpmgcloudops.com.pfx"
  },
  {
    certname   = "bmprest_kpmgcloudops_com",
    sslcertpfx = "bmprest.kpmgcloudops.com.pfx"
  },
  {
    certname   = "meprest_kpmgcloudops_com",
    sslcertpfx = "meprest.kpmgcloudops.com.pfx"
  },
  {
    certname   = "mep_kpmgcloudops_com",
    sslcertpfx = "mep.kpmgcloudops.com.pfx"
  },
  {
    certname   = "das_kpmgcloudops_com",
    sslcertpfx = "das.kpmgcloudops.com.pfx"
  },
  {
    certname   = "dasrest_kpmgcloudops_com",
    sslcertpfx = "dasrest.kpmgcloudops.com.pfx"
  },
  {
    certname   = "dash_kpmgcloudops_com",
    sslcertpfx = "dash.kpmgcloudops.com.pfx"
  },
  {
    certname   = "act_kpmgcloudops_com",
    sslcertpfx = "act.kpmgcloudops.com.pfx"
  },
  {
    certname   = "bmpfa_kpmgcloudops_com",
    sslcertpfx = "bmpfa.kpmgcloudops.com.pfx"
  }
]

# Managed Instanace Variables
address_space_string_format               = "PROD MI Not Managing through Terraform"
db1_subnet_adress_space                   = "PROD MI Not Managing through Terraform"
FirewallIPAddress                         = "PROD MI Not Managing through Terraform"
managedInstanceadministratorLogin         = "PROD MI Not Managing through Terraform"
managedInstanceadministratorLoginPassword = "PROD MI Not Managing through Terraform"
managedInstanceskuName                    = "PROD MI Not Managing through Terraform"
managedInstancelicenseType                = "PROD MI Not Managing through Terraform"

# NSG Rule IP's
KIPAGW_PIP         = ["52.249.195.183/32"]
KPMG_PIP           = [
    "103.133.112.80/28",
    "103.216.201.96/28",
    "103.58.118.0/24",
    "199.207.253.0/24",
    "172.27.229.0/24",
    "199.206.0.5/32",
    "212.163.33.165",
    "213.194.44.28",
    "213.194.44.29",
    "213.194.44.30",
    "213.194.44.121",
    "20.185.106.126",
    "20.185.110.197",
    "20.185.211.106",
    "158.180.128.10",
    "158.180.192.10",
    "104.211.19.220/32",
    "52.224.25.180",
    "52.224.25.158",
    "52.224.25.140",
    "20.42.39.126",
    "52.224.25.167"
]
kart_ase_public_ip = ["52.170.100.57/32"]
az_fw_public_ips   = [
  "52.224.25.180/32",
  "52.224.25.158/32",
  "52.224.25.140/32",
  "20.42.39.126/32",
  "52.224.25.167/32",
  "52.170.175.39/32",
  "52.170.174.246/32",
  "52.188.26.32/32",
  "52.188.27.2/32",
  "52.188.26.99/32"
]

# Private DNS Variables
pvt_dns_subscription_id          = "4c9dc048-01dc-4854-9063-8a3d4060993a"
private_dns_zone_vault           = "privatelink.vaultcore.azure.net"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-pd"

dns_suffix                       = "kpmgcloudops.com"
app_url_acronym                  = ""

# app service plan
asp_tier                                = "Isolated"
asp_size                                = "I2"
asp_capacity                            = "1"

ase_internal_ip                            = "10.26.43.11"