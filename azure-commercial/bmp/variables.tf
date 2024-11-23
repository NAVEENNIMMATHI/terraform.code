variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "environment" {
  type = string
}

variable "application_acronym" {
  type = string
}

variable "location" {
  type = string
}

variable "location_acronym" {
  type = string
}

variable "environment_acronym" {
  type = string
}

variable "environment_acronym2" {
  type = string
}

variable "environment_acronym_ad_app" {
  type = string
}

variable "app_gateway_environment_acronym" {
  type = string
}

variable "app_gateway_environment_acronym2" {
  type = string
}

variable "tags" {
  type = map(string)
}


# Network Security Groups Variables

variable "bmpdb1_subnet_adress_space" {
  type = string
}


# Virtual Network Variables

variable "subnet_name_agw_address_space" {
  type = list(string)
}

variable "subnet_name_app_address_space" {
  type = list(string)
}

variable "subnet_name_api_address_space" {
  type = list(string)
}

variable "subnet_name_rest_address_space" {
  type = list(string)
}

variable "subnet_name_info_address_space" {
  type = list(string)
}

variable "subnet_name_db_address_space" {
  type = list(string)
}

variable "subnet_name_ase_address_space" {
  type = list(string)
}

variable "subnet_name_pe_address_space" {
  type = list(string)
}

# Virtual Machine Count Variables

variable "count_value_bmpapp1vm" {
  type = number
}

variable "count_value_bmprest1vm" {
  type = number
}

variable "count_value_bmpappvm_module" {
  type = number
}

variable "count_value_bmprestvm_module" {
  type = number
}

variable "count_value_bmpinfovm_module" {
  type = number
}

variable "count_value_bmpkpimvm_module" {
  type = number
}

variable "vmsize_app" {
  type = string
}

variable "vmsize_rest" {
  type = string
}

variable "vmsize_info" {
  type = string
}

variable "vmsize_kpi" {
  type = string
}


# Domain Variables

variable "domain_name" {
  type = string
}

variable "ou_path" {
  type = string
}

variable "domain_user_name" {
  type = string
}

variable "domain_user_password" {
  type = string
}


# Disk Encryption Variables

variable "encryptappsp_key_password" {
  type = string
}


# BMP SQL UDR (Route Table) variable

variable "dns_server" {
  type = list(string)
}

variable "address_space" {
  type = list(string)
}

variable "custom_emails" {
  type = string
}

variable "admin_password" {
  type = string
}


# Application Gateway Variables

variable "app_gw_sku_name" {
  type = string
}

variable "app_gw_sku_tier" {
  type = string
}

variable "app_gw_sku_capacity" {
  type = number
}

variable "appcertpwd" {
  type = string
}

variable "kpimcertpwd" {
  type = string
}

variable "restcertpwd" {
  type = string
}

variable "meprestcertpwd" {
  type = string
}

variable "mepcertpwd" {
  type = string
}

variable "dascertpwd" {
  type = string
}

variable "dasrestcertpwd" {
  type = string
}

variable "dashcertpwd" {
  type = string
}

variable "actcertpwd" {
  type = string
}

variable "backupmanagement_service_principal_name" {
  type = string
}

variable "encryptapp_service_principal_name" {
  type = string
}

variable "cloudops_keyvault_admin_group_name" {
  type = string
}

variable "network_rule_default_action" {
  type = string
}

variable "platform_fault_domain_count" {
  type = number
}

variable "azurerm_image_id" {
  type = string
}

variable "spi_log_analytics_workspace_name" {
  type = string
}

variable "spi_log_analytics_workspace_rg_name" {
  type = string
}

#Azure Firewall Private IP
variable "azfirewall_ip_address" {
  type = string
}

#PaloAlto Firewall Details
variable "paloalto_route_table_name" {
  type = string
}

variable "paloalto_route_table_rg_name" {
  type = string
}

#Virtual Network Peering
variable "coresubscriptionid" { type = string }

variable "transitsubscriptionid" { type = string }

variable "newcoresubscriptionid" { type = string }

variable "corevnetresourcegroup" { type = string }

variable "transitvnetresourcegroup" { type = string }

variable "newcorevnetresourcegroup" { type = string }

variable "corevnetname" { type = string }

variable "transitvnetname" { type = string }

variable "newcorevnetname" { type = string }

variable "authentication_certificates" {
  type    = list(map(string))
  default = []
}

variable "ssl_certificates" {
  type    = list(map(string))
  default = []
}

# Managed Instanace Variables
variable "address_space_string_format" {
  type    = string
  default = ""
}

variable "db1_subnet_adress_space" {
  type    = string
  default = ""
}

variable "FirewallIPAddress" {
  type    = string
  default = ""
}

variable "managedInstanceadministratorLogin" {
  type    = string
  default = ""
}

variable "managedInstanceadministratorLoginPassword" {
  type    = string
  default = ""
}

variable "managedInstanceskuName" {
  type    = string
  default = ""
}

variable "managedInstancelicenseType" {
  type    = string
  default = ""
}

#Application Gateway outbound IP
variable "KIPAGW_PIP" {
  type = list(string)
}

#ApplicationGateway inbound public IP
variable "KPMG_PIP" {
  type = list(string)
}

#KART ASE Public IP
variable "kart_ase_public_ip" {
  type = list(string)
}

#AZ FW Public IPs
variable "az_fw_public_ips" {
  type = list(string)
}

variable "pvt_dns_subscription_id" {
  type = string
}

# Private DNS Variables

variable "private_dns_zone_vault" {
  type = string
}

variable "private_dns_zone_resource_group" {
  type = string
}

#App Service Environment
variable "dns_suffix" {
  type    = string
  default = ""
}

variable "app_url_acronym" {
  type    = string
  default = ""
}

variable "asp_tier" {
  type    = string
  default = ""
}

variable "asp_size" {
  type    = string
  default = ""
}

variable "asp_capacity" {
  type    = string
  default = ""
}

variable "ase_internal_ip" {
  type    = string
  default = ""
}