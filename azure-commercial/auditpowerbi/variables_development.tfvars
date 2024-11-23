# Authentication Varibles
subscription_id = "c72acede-d539-45d9-963d-3464ec4ddae0"
client_id       = "f294bc17-39a8-477e-aeac-b73870cc67b5"
client_secret   = ""
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

# Secrets
common_virtual_machine_password = ""

# Project Variables
application_acronym    = "core"
environment            = "development"
environment_acronym    = "dv"
location               = "eastus"
location_acronym       = "use"

tags = {
  Environment = "Development"
  LOB         = "Advisory Other"
  Node        = "Hub"
  Platform    = "Azure Commercial Cloud"
  Solution    = "Audit Power BI"
}

# Firewall Variables
firewall_environment     = "dev-core"
firewall_pip_environment = "dev"

# Virtual Networks Variables

# Subnet Variables
audit_wst_subnet_address_prefix   = "10.6.21.0/28"

# Key Vault Variables
key_vault_name                    = "codvkeyv01hub"
copeusopskeys01hub_key_vault_name = "codvopskeys01hub"
disk_encrypt_app_object_id        = "e7d02040-7211-43c4-96d3-5852d09ae471"
bms_object_id                     = "24f4c0a4-5333-451d-b082-c5b2dc0f4932"
diskencryptvault_name             = "kvl-use-ade-c72acede"
diskencryptvault_rg_name          = "RGP-USE-CORE-DEV"

# Recovery Services Vault Variables
recovery_services_vault_name    = "codvrecvault01hub"

# Storage Account Variables
vm_diagnostics_logs_storage_account_name    = "codvcorevmlog01sa"

## Workstation Instance
vm_count_auditwst           = "1"
vm_size_auditwst            = "Standard_D4s_v3"

encryptappsp_key_password   = "TBD" 

## Domain Variables
domain_name          = ""
ou_path              = ""
domain_user_name     = ""
domain_user_password = ""

hubvnet_resource_group_name = "CO-dv-eastus-hubvnet-rg"
hubvnet_name                = "CO-dv-eastus-hub-vnet"

routetable_resource_group_name = "CO-dv-eastus-hubvnet-rg"
routetable_name                = "co-dv-eastus-hubtopaloaltofw-udr"

vmdiagnosticslogs_resource_group_name = "CO-dv-eastus-loganalytics-rg"
vmdiagnosticslogs_name                = "codvcorevmlog01saz"

loganalyticsworkspace_resource_group_name = "co-dv-eastus-loganalytics-rg"
loganalyticsworkspace_name = "CO-dv-eastus-hub1-workspacez"

encryptapp_sp_name = "spn-devops-3507153c"

keyvault_resource_group_name = "RGP-USE-CORE-DEV"
keyvault_name = "kvl-use-core-c72acede"

admin_password = ""