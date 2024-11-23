# Azure Authentication
client_id       = "2216ff1e-a4a3-4139-95e9-b4b89e001457"
client_secret   = ""
subscription_id = "104a6d25-89e7-4297-9d68-76c0443b2cf6"
tenant_id       = "b5031e57-d76f-422e-87c6-02b4cc749974"

# Project variables
application_acronym = "vmap"
environment_acronym = "uat"
location_acronym    = "use"
location            = "eastus"
tags = {
  Environment     = "UAT"
  LOB             = "Risk Advisory Solutions"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Virtual Machine Auto Provisioning (VMAP)"
  BusinessContact = "johnhlee@kpmg.com"
  BusinessOwner   = "Lee, John H"
}

# Application Gateway
application_gateway = {
  environment_acronym = "uat"
  sku = {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = "2"
  }
}
dns_servers            = ["10.30.15.197", "10.30.15.196"]
frontend_pfx_cert_name = "vmapuat.kpmgcloudops.com"

#App Service
app_service_plan_size = "I2"
app_service_plan_tier = "Isolated"

# Shared RAS Storage
shared_state_storage_account = {
  name                = "stousecommon104a6d25"
  resource_group_name = "RGP-USE-COMMON"
  container_name      = "terraformstatecontainer"
  blob_key_name       = "iac-acc-shared-ras.uat.tfstate"
}

# Subnets
subnets = {
  "agw" = {
    address_space = "10.50.87.224/28"
  }
  "pe" = {
    address_space = "10.50.87.240/28"
  }
}

#Private DNS Variables
pvt_dns_subscription_id          = "4c9dc048-01dc-4854-9063-8a3d4060993a"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-pd" # we only have one dns zone per tenant

#App Service Environment variables
ase_name                     = "ase-use-sharedras-uat"
ase_resource_group_name      = "RGP-USE-ASE-UAT"

