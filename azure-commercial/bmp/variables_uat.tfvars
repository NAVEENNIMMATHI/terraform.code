client_id       = "9975dc86-7489-483c-b49c-47bdff5e2eb8"
client_secret   = ""
subscription_id = "b75fc3c3-04a4-45a6-b126-8279f505e873"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

environment                     = "uat"
application_acronym             = "bmp"
location_acronym                = "use"
location                        = "eastus"
environment_acronym             = "uat"
environment_acronym2            = "ut"
environment_acronym_ad_app      = "uat"
app_gateway_environment_acronym = "uat"
app_gateway_environment_acronym2 = "u"

tags = {
  Environment = "UAT",
  LOB         = "Deal Advisory & Strategy",
  Node        = "Spoke",
  Platform    = "Azure Commercial Cloud",
  Solution    = "Benchmarking Plus (BMP)"
}

# Network Security Groups Variables
bmpdb1_subnet_adress_space = "10.51.0.128/26"

# Virtual Network Variables
subnet_name_agw_address_space  = ["10.51.0.32/27"]
subnet_name_app_address_space  = ["10.51.0.0/28"]
subnet_name_api_address_space  = ["10.51.0.16/28"]
subnet_name_rest_address_space = ["10.51.0.64/28"]
subnet_name_info_address_space = ["10.51.0.80/28"]
subnet_name_db_address_space   = ["10.51.0.128/26"]
subnet_name_ase_address_space  = ["10.51.43.0/26"] #ase
subnet_name_pe_address_space   = ["10.51.43.64/27"] #pe

# Virtual Machine Count Variables
count_value_bmpapp1vm        = 0
count_value_bmprest1vm       = 0
count_value_bmpappvm_module  = 2
count_value_bmprestvm_module = 3
count_value_bmpinfovm_module = 1
count_value_bmpkpimvm_module = 1
vmsize_app                   = "Standard_D4s_v3"
vmsize_info                  = "Standard_D4s_v3"
vmsize_kpi                   = "Standard_D4s_v3"
vmsize_rest                  = "Standard_D4s_v3"

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
encryptapp_service_principal_name       = "DiskEncryptApp"
cloudops_keyvault_admin_group_name      = "CO-TerraformStorage-Admin"

network_rule_default_action = "Allow"
platform_fault_domain_count = 2
azurerm_image_id            = ""

#SPI
spi_log_analytics_workspace_name    = "law-use-da-shared-ut"
spi_log_analytics_workspace_rg_name = "RGP-USE-SHARED-DA-UT"

#Azure Firewall Private IP
azfirewall_ip_address = "10.100.2.196"

#PaloAlto Firewall Details
paloalto_route_table_name    = "co-p-eastus-spitoPaloAlto-udr"
paloalto_route_table_rg_name = "CO-P-eastus-cospivnet-rg"

#Virtual Network Peering
coresubscriptionid       = "4c9dc048-01dc-4854-9063-8a3d4060993a"
transitsubscriptionid    = "0d7a7f3c-a15d-4d37-924c-2507147fb74c"
newcoresubscriptionid    = "931d8a2f-96bb-44d3-9b06-6c05c41c4060"
corevnetresourcegroup    = "CO-P-eastus-hubvnet-rg"
transitvnetresourcegroup = "CO-P-eastus-transitvnet-rg"
newcorevnetresourcegroup = "RGP-USE-COREVNET-UAT"
corevnetname             = "CO-P-eastus-hub-vnet"
transitvnetname          = "CO-P-eastus-transit-vnet"
newcorevnetname          = "vnt-use-core-uat"

authentication_certificates = [
  {
    certname    = "bmpuat_kpmgcloudops_com",
    authcertcer = "bmpuat.kpmgcloudops.com.cer"
  },
  {
    certname    = "star_kpmgcloudops_com",
    authcertcer = "star.kpmgcloudops.com.cer"
  }
]

ssl_certificates = [
  {
    certname   = "bmpuat_kpmgcloudops_com",
    sslcertpfx = "bmpuat.kpmgcloudops.com.pfx"
  },
  {
    certname   = "bmpfau_kpmgcloudops_com",
    sslcertpfx = "bmpfau.kpmgcloudops.com.pfx"
  }
]

# Managed Instanace Variables
address_space_string_format               = "10.51.0.0/24"
db1_subnet_adress_space                   = "10.51.0.128/26"
FirewallIPAddress                         = "10.100.2.196"
managedInstanceadministratorLogin         = "bmpmiadmin"
managedInstanceadministratorLoginPassword = ""
managedInstanceskuName                    = "GP_Gen5"
managedInstancelicenseType                = "LicenseIncluded"

# NSG Rule IP's
KIPAGW_PIP         = ["52.224.104.52/32"]
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
  "13.68.253.81/32",
  "52.170.175.39",
  "52.170.174.246",
  "52.188.26.32",
  "52.188.27.2",
  "52.188.26.99"
]
kart_ase_public_ip = ["52.224.124.50/32"] # dummy value, once KART ASE is provisioned in UAT, enter it's public IP here
az_fw_public_ips   = [
  "52.170.175.39/32",
  "52.170.174.246/32",
  "52.188.26.32/32",
  "52.188.27.2/32",
  "52.188.26.99/32"
]

#Private DNS Variables
pvt_dns_subscription_id          = "4c9dc048-01dc-4854-9063-8a3d4060993a"
private_dns_zone_vault           = "privatelink.vaultcore.azure.net"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-pd" # we only have one dns zone per tenant

dns_suffix                       = "kpmgcloudops.com"
app_url_acronym                  = "uat"

# app service plan
asp_tier                                = "Isolated"
asp_size                                = "I1"
asp_capacity                            = "1"

ase_internal_ip                            = "10.51.43.11"