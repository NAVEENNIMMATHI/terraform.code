variable "subscription_id" {type = string}
variable "client_id" {type = string}
variable "client_secret" {type = string}
variable "tenant_id" {type = string}

#ResourceGroup
variable "location" {type = string}
variable "tags" {type = map(string)}
variable "adminvmtag" {type = map(string)}
variable "buildvmtag" {type = map(string)}
variable "application_acronym" {type = string}
variable "environment_acronym" {type = string}
variable "location_acronym" {type = string}
variable "ad_group_environment_suffix" {type = string}
variable "vnet_environment_suffix" {type = string}

#Network and Subnets
variable "vnet_address_space" {type = list(string)}
variable "ase_subnet_address_space" {type = string}
variable "firewall_ip_addresses" {type = list(string)}
variable "mgmt_subnet_address_space" {type = string}
variable "build_subnet_address_space" {type = string}
variable "agw_subnet_address_space" {type = string}
variable "agw_subnet_address_space_kpmgonly" {type = string}
variable "pbi_subnet_address_space" {type = string}
variable "wst_subnet_address_space" {type = string}
variable "pe_subnet_address_space" {type = string}
variable "rri_pe_subnet_address_space" {type = string}
variable "kip_pe_subnet_address_space" {type = string}
variable "dns_servers" {type = list(string)}
variable "ase_outbound_ip_addresses" {type = list(string)}
variable "kip_ase_pip" { type = list(string) }
variable "canada_member_firm_pip" { type = list(string) }

#VirtualNetwork Peering
variable "coresubscriptionid" {type = string}
variable "corevnet_resource_group_name" {type = string}
variable "core_vnet_name" {type = string}

#RouteTable
variable "firewall_network_name" {type = string}
variable "firewall_network_rg_name" {type = string}

#ASEILB
variable "ase_ilb_dns_name" {type = string}

#KeyVault
variable "encryptapp_sp_name" {type = string}
variable "cloudops_keyvault_admin_group_name" {type = string}

#Virtual Machine
variable "vm_count_build" {type = string}
variable "vm_count_buildvm_dotnet4_5" {type = string}
variable "vm_size_build" {type = string}
variable "vm_count_admin" {type = string}
variable "vm_size_admin" {type = string}
variable "vm_count_pbi" {type = string}
variable "vm_size_pbi" {type = string}
variable "vm_count_wst" {type = string}
variable "vm_size_wst" {type = string}
variable "domain_name" {type = string}
variable "ou_path" {type = string}
variable "domain_user_name" {type = string}
variable "domain_user_password" {type = string}
variable "admin_password" {type = string}
variable "vm_count_buildvm_kme" {type = string}

#Netapp
variable "netapp_resource_group" {type = string}
variable "netapp_resource_group_location" {type = string}
variable "netapp_account_name" {type = string}
variable "netapp_pool_name" {type = string}
variable "netapp_subnet_id" {type = string}
variable "netapp_subscription_id" {type = string}

#StorageAccount
variable "agent_subnet_id" {type = string}
variable "core_aks_subnet_id" {type = string}

# Private DNS Zone
variable "private_dns_zone_subscription" {type = string}
variable "private_dns_zone_resource_group_name" {type = string}
variable "private_dns_zone_name_file" {type = string}