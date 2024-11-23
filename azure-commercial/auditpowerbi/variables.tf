# Authentication Varibles
variable "client_id" { type = string }
variable "client_secret" { type = string }
variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

# Secrets
variable "common_virtual_machine_password" { type = string }

# Project Variables
variable "application_acronym" { type = string }
variable "environment" { type = string }
variable "environment_acronym" { type = string }
variable "location" { type = string }
variable "location_acronym" { type = string }

variable "tags" { type = map(string) }







# Firewall Variables
variable "firewall_environment" { type = string }
variable "firewall_pip_environment" { type = string }

# Virtual Network Variables

# Subnet Variables
variable "audit_wst_subnet_address_prefix" { type = string }

# Key Vault Variables
variable "key_vault_name" { type = string }
variable "copeusopskeys01hub_key_vault_name" { type = string }
variable "disk_encrypt_app_object_id" { type = string }
variable "bms_object_id" { type = string }
variable "diskencryptvault_name" { type = string }
variable "diskencryptvault_rg_name" { type = string }

# Recovery Services Vault Variables
variable "recovery_services_vault_name" { type = string }

# Storage Account Variables
variable "vm_diagnostics_logs_storage_account_name" { type = string }

# Workstation Instance
variable "vm_count_auditwst" { type = string }
variable "vm_size_auditwst" { type = string }

variable "encryptappsp_key_password" { type = string }

# Domain Instance
variable "domain_name" { type = string }
variable "ou_path" { type = string }
variable "domain_user_name" { type = string }
variable "domain_user_password" { type = string }

variable "hubvnet_resource_group_name" { type = string }
variable "hubvnet_name" { type = string }

variable "routetable_resource_group_name" { type = string }
variable "routetable_name" { type = string }

variable "vmdiagnosticslogs_resource_group_name" { type = string }
variable "vmdiagnosticslogs_name" { type = string }

variable "loganalyticsworkspace_resource_group_name" { type = string }
variable "loganalyticsworkspace_name" { type = string }

variable "encryptapp_sp_name" {type = string}

variable "keyvault_resource_group_name" { type = string }
variable "keyvault_name" { type = string }

variable "admin_password" { type = string }