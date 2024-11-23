client_id       = "b964573c-e75c-4c3c-a59f-5d69a287e284"
client_secret   = ""
subscription_id = "84c5a4ce-8d9d-45f0-b15a-552d0f67db83"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

environment                     = "staging"
application_acronym             = "bmp"
location_acronym                = "use"
location                        = "eastus"
environment_acronym             = "stg"
app_gateway_environment_acronym = "stg"

tags = {
  Environment = "Staging",
  LOB         = "Deal Advisory & Strategy",
  Node        = "Spoke",
  Platform    = "Azure Commercial Cloud",
  Solution    = "Benchmarking Plus (BMP)"
}

# Network Security Groups Variables
bmpdb1_subnet_adress_space = "10.71.0.128/26"

# Virtual Network Variables
subnet_name_agw_address_space  = ["10.71.0.32/27"]  #agw
subnet_name_app_address_space  = ["10.71.0.0/28"]   #app
subnet_name_api_address_space  = ["10.71.0.16/28"]  #api
subnet_name_rest_address_space = ["10.71.0.64/28"]  #rest
subnet_name_info_address_space = ["10.71.0.80/28"]  #informatica
subnet_name_db_address_space   = ["10.71.0.128/26"] #db

# Virtual Machine Count Variables
count_value_bmpapp1vm        = 1
count_value_bmprest1vm       = 1
count_value_bmpappvm_module  = 1
count_value_bmprestvm_module = 1
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
address_space  = ["10.71.0.0/24"]
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
spi_log_analytics_workspace_name    = "law-use-da-shared-stg"
spi_log_analytics_workspace_rg_name = "RGP-USE-SHARED-DA-stg"

# NSG Rule IP's
KIPAGW_PIP = ["52.168.51.104/32"]
KPMG_PIP   = [
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
  "13.68.253.81/32"
]

#Private DNS Variables
pvt_dns_subscription_id = "4c9dc048-01dc-4854-9063-8a3d4060993a"
