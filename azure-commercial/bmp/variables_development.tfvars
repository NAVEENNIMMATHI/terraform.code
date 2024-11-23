client_id       = "e0628e55-2ee3-4131-8fdd-330265aed576"
client_secret   = ""
subscription_id = "3507153c-e6a4-4e2f-ae04-f34c1fd4482f"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

environment                     = "development"
application_acronym             = "bmp"
location_acronym                = "use"
location                        = "eastus"
environment_acronym             = "dv"
environment_acronym2            = "dv"
environment_acronym_ad_app      = "dev"
app_gateway_environment_acronym = "dev"
app_gateway_environment_acronym2 = "d"

tags = {
  Environment = "Development",
  LOB         = "Deal Advisory & Strategy",
  Node        = "Spoke",
  Platform    = "Azure Commercial Cloud",
  Solution    = "Benchmarking Plus (BMP)"
}

# Network Security Groups Variables
bmpdb1_subnet_adress_space = "10.51.0.128/26"

# Virtual Network Variables
subnet_name_agw_address_space  = ["10.51.0.32/27"]  #agw
subnet_name_app_address_space  = ["10.51.0.0/28"]   #app
subnet_name_api_address_space  = ["10.51.0.16/28"]  #api
subnet_name_rest_address_space = ["10.51.0.64/28"]  #rest
subnet_name_info_address_space = ["10.51.0.80/28"]  #informatica
subnet_name_db_address_space   = ["10.51.0.128/26"] #db
subnet_name_ase_address_space  = ["10.51.43.0/26"] #ase
subnet_name_pe_address_space   = ["10.51.43.64/27"] #pe

# Virtual Machine Count Variables
count_value_bmpapp1vm        = 0
count_value_bmprest1vm       = 0
count_value_bmpappvm_module  = 4
count_value_bmprestvm_module = 4
count_value_bmpinfovm_module = 1
count_value_bmpkpimvm_module = 1
vmsize_app                   = "Standard_D2s_v3"
vmsize_info                  = "Standard_D2s_v3"
vmsize_kpi                   = "Standard_D2s_v3"
vmsize_rest                  = "Standard_D2s_v3"

# Domain Variables
domain_name          = "kconp.local"
ou_path              = "OU=AADDC Computers,DC=kconp,DC=local"
domain_user_name     = ""
domain_user_password = ""

# Disk Encryption Variables
encryptappsp_key_password = ""

# BMP SQL UDR (Route Table) variable
dns_server = [
  "10.1.11.4",
  "10.1.11.5",
  "168.63.129.16"
]
address_space  = ["10.51.0.0/24","10.51.43.0/24"]
custom_emails  = "go-fmmanagedservices@kpmg.com"
admin_password = ""

# Application Gateway Variables
app_gw_sku_capacity = 2
app_gw_sku_name     = "WAF_Medium"
app_gw_sku_tier     = "WAF"

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
encryptapp_service_principal_name       = "EncryptApp"
cloudops_keyvault_admin_group_name      = "CO-Certificate-KeyVault"

network_rule_default_action = "Allow"
platform_fault_domain_count = 2
azurerm_image_id            = ""

#SPI
spi_log_analytics_workspace_name    = "law-use-da-shared-dev"
spi_log_analytics_workspace_rg_name = "rgp-use-shared-da-dev"

#Azure Firewall Private IP
azfirewall_ip_address = "10.6.24.4"

#PaloAlto Firewall Details
paloalto_route_table_name    = "co-np-eastus-spitoPaloAlto-udr"
paloalto_route_table_rg_name = "co-np-eastus-co-spivnet-rg"

#Virtual Network Peering
coresubscriptionid       = "4cdcf904-fa57-4815-8cb3-e33b9b44f479"
transitsubscriptionid    = "25f8d797-bee2-4a88-84cc-de328abd6731"
newcoresubscriptionid    = "c72acede-d539-45d9-963d-3464ec4ddae0"
corevnetresourcegroup    = "co-np-eastus-core1-rg"
transitvnetresourcegroup = "CO-NP-eastus-CONPTVnet-rg"
newcorevnetresourcegroup = "CO-dv-eastus-hubvnet-rg"
corevnetname             = "co-np-eastus-core1-vnet"
transitvnetname          = "CO-NP-eastus-transit1-Vnet"
newcorevnetname          = "CO-dv-eastus-hub-vnet"

authentication_certificates = [
  {
    certname    = "bmpdev_kpmgcloudops_com",
    authcertcer = "bmpdev.kpmgcloudops.com.cer"
  },
  {
    certname    = "star_kpmgcloudops_com",
    authcertcer = "star.kpmgcloudops.com.cer"
  }
]

ssl_certificates = [
  {
    certname   = "bmpdev_kpmgcloudops_com",
    sslcertpfx = "bmpdev.kpmgcloudops.com.pfx"
  },
  {
    certname   = "bmpfad_kpmgcloudops_com",
    sslcertpfx = "bmpfad.kpmgcloudops.com.pfx"
  }
]

# Managed Instanace Variables
address_space_string_format               = "10.51.0.0/24"
db1_subnet_adress_space                   = "10.51.0.128/26"
FirewallIPAddress                         = "10.6.24.4"
managedInstanceadministratorLogin         = "bmpmiadmin"
managedInstanceadministratorLoginPassword = ""
managedInstanceskuName                    = "GP_Gen5"
managedInstancelicenseType                = "LicenseIncluded"

# NSG Rule IP's
KIPAGW_PIP         = ["52.152.171.172/32"]
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
  "137.116.114.62/32",
  "52.190.37.51",
  "52.190.37.75",
  "52.146.53.140",
  "52.146.53.139",
  "52.146.53.16"
]
kart_ase_public_ip = ["52.224.124.50/32"]
az_fw_public_ips   = [
  "52.190.37.51/32",
  "52.190.37.75/32",
  "52.146.53.140/32",
  "52.146.53.139/32",
  "52.146.53.16/32",
  "40.76.169.86/32",
  "40.76.168.231/32",
  "40.76.169.36/32",
  "40.76.169.44/32",
  "40.76.169.103/32"
]

#Private DNS Variables
pvt_dns_subscription_id          = "c72acede-d539-45d9-963d-3464ec4ddae0"
private_dns_zone_vault           = "privatelink.vaultcore.azure.net"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-dv"

dns_suffix                       = "kpmgcloudops.com"
app_url_acronym                  = "d"

# app service plan
asp_tier                                   = "Isolated"
asp_size                                   = "I1"
asp_capacity                               = "1"

ase_internal_ip                            = "10.51.43.11"