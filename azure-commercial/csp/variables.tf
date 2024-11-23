
#ResourceGroup

variable "application_acronym" {
  type = string
}
variable "location_acronym" {
  type = string
}
variable "environment_acronym" {
  type = string
}
variable "location" {
  type = string
}

variable "target_deployment_environment" {
  type = string
}

#Backend Variables

variable "tenant_id" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}

variable "tags" {
  type = map(string)
}


#Virtual Network Variables

variable "spoke_vnet_name" {
  type = string
}
variable "spoke_vnet_rg_name" {
  type = string
}



/*variable "private_dns_zone_subscription" {
  type = string
}

variable "private_dns_zone_resource_group_name" {
  type = string
}

variable "private_dns_zone_name_azurecr" {
  type = string
}

variable "private_dns_zone_name_vaultcore" {
  type = string
}
*/

#Spoke Variables

variable "spoke_law_name" {
  type = string
}

variable "spoke_law_rg_name" {
  type = string
}


# RouteTable

variable "firewall_primary_core" {
  type  = string
}

variable "azfwsubscriptionid" {
  type  = string
}

variable "firewall_network_name" {
  type  = string
}

variable "firewall_network_rg_name" {
  type  = string
}

# AppInsights
variable "sampling_percentage" {
  default = 100
  type    = number
}

variable "application_type" {
  default = "web"
  type    = string
}

variable "pipeline_service_principal_name" {
type = string
}

#Key Vault Sercret

variable "csp_clarizen_api_key" {
  type = string
}

variable "csp_sync_blob_key" {
  type = string
}

variable "csp_success_spn_key" {
  type = string
}

variable "kpmg_nat_ip_list" { 
  type = list(string) 
}

variable "powerapps_whitelist_ips" { 
  type = list(string) 
}

#spn
variable "spn_redirect_url" { 
  type = list(string) 
}

#ad_user
variable "tenant_fqdn" {
  type = string
}

variable "csp_service_account_user"{
  type = string
}

variable "csp_service_account_password"{
  type = string
}
