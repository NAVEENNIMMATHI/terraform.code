# Azure Authentication
client_id       = "c79c197f-2835-49dc-846a-06644d7f10c4"
client_secret   = ""
subscription_id = "57fad7dc-7eeb-4a2c-b3b7-405d9f8d3cc8"
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

# Project variables
application_acronym = "vmap"
environment_acronym = "dv"
location_acronym    = "use"
location            = "eastus"
tags = {
  Environment     = "Development"
  LOB             = "Risk Advisory Solutions"
  Node            = "Spoke"
  Platform        = "Azure Commercial Cloud"
  Solution        = "Virtual Machine Auto Provisioning (VMAP)"
  BusinessContact = "johnhlee@kpmg.com"
  BusinessOwner   = "Lee, John H"
}

# Application Gateway
application_gateway = {
  environment_acronym = "Dev"
  sku = {
    name     = "WAF_Medium"
    tier     = "WAF"
    capacity = "2"
  }
}
dns_servers            = ["10.1.11.4", "10.1.11.5"]
frontend_pfx_cert_name = "vmapdev.kpmgcloudops.com"

#App Service
app_service_plan_size = "I2"
app_service_plan_tier = "Isolated"

# Shared RAS Storage
shared_state_storage_account = {
  name                = "stousecommon57fad7dc"
  resource_group_name = "RGP-USE-COMMON"
  container_name      = "terraformstatecontainer"
  blob_key_name       = "iac-acc-shared-ras.dv.tfstate"
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
pvt_dns_subscription_id          = "c72acede-d539-45d9-963d-3464ec4ddae0"
private_dns_zone_resource_group  = "rgp-use-core-private-dnszone-dv" # we only have one dns zone per tenant

#App Service Environment variables
ase_name                     = "ase-use-dvapp-dv"
ase_resource_group_name      = "RGP-USE-ASE-DV"

