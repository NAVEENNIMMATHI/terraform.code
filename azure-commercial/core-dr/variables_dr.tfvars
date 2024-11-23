# Authentication Varibles
subscription_id = "da272037-3e65-4b59-b94c-b923105b56c5"
client_id       = "e52bae40-c939-4771-86a7-6461c8e3f9dd"
client_secret   = ""
tenant_id       = "188697ab-840f-44ec-8535-aaaa5680bab0"

# Tags
tags = {
  Environment = "Development-DR",
  LOB         = "Advisory Other",
  Node        = "Hub",
  Platform    = "Azure Commercial Cloud",
  Solution    = "Core"
}

# Project Variables
application_acronym            = "core-dr"
project_name                   = ""
environment_acronym_rg = "dv"

# Project Variables
location_dr            = "westus"
location_dr_acronym    = "usw"
environment_acronym    = "dr"
# workload vnet variables
dr_workload_vnet_address_space             = ["10.120.0.0/17"]
# subnet variables
subnet_address_space_workload              = ["10.120.3.0/25"]
# core vnet
dr_vnet_address_space    = ["10.200.0.0/20" , "10.201.0.0/16"]
hub_vnet_dns_servers      = ["10.1.11.4", "10.1.11.5"]
# subnet variables
subnet_address_space_dr_core1              = ["10.200.5.0/24"]
# AZFW Private IP (to avoid circular dependencies)
azure_firewall_private_ip = "10.6.24.4"

# Sample Workload VM Variable Values
dr_sample_workload_vms = {
  count_value             = "5"
  availability_set_id     = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.Compute/availabilitySets/avs-use-ha-dr-dev"
  resource_group_name     = "RGP-USW-CORE-DR-DV"
  resource_group_location = "westus"
  subnet_id               = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.Network/virtualNetworks/vnt-usw-dr-workload-dv/subnets/sub-usw-dr-test1-dv"
  vm_size                 = "Standard_DS2_v2"
  storage_uri             = "https://stouselawdrdv.blob.core.windows.net/"
}
# HA DR Hybrid Worker
ha_dr_hybwrk = {
  count_value                   = "3"
  resource_group_name_ha_dr     = "RGP-USW-CORE-DR-DV"
  location_ha_dr                = "eastus"
  subnet_id_ha_dr               = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.Network/virtualNetworks/vnt-usw-ha-dv-test/subnets/subnet1-ha-test"
  vm_size_ha_dr                 = "Standard_DS2_v2"
  storage_uri_ha_dr             = "https://stouselawdrdv.blob.core.windows.net/"
  application_acronym_ha_dr     = "core"
  availability_set_id_ha_dr     = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.Compute/availabilitySets/avs-use-ha-dr-dev"
  vm_environment_ha_dr          = "dr" 
  project_name_ha_dr            = "hywk" # ha dr hybrid worker
  data_disk_size_ha_dr          = 128
  zones                         = "1"
  admin_password                = "hAhbOexh7J6X"
}
tags_ha_dr = {
  Platform        = "Azure Commercial Cloud"
  Environment     = "dr"
  Node            = "Hub"
  Solution        = "Core"
  LOB             = "Advisory Other"
}

need_zones = false

aks = {
  aks_node_rg_name = "MC_RGP-USW-CORE-DR-DV_aks-use-dr-dv_eastus"
  aks_rg_name = "RGP-USW-CORE-DR-DV"
  location = "East US"
  aks_version = "1.22.11"
  aks_default_node_pool_name = "agentpool"
  aks_default_node_count = "1"
  aks_default_max_count = "4"
  aks_default_min_count = "1"
  aks_default_node_size = "Standard_DS2_v2"
  aks_subnet_id = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/MC_RGP-USW-CORE-DR-DV_aks-use-dr-dv_eastus/providers/Microsoft.Network/virtualNetworks/aks-vnet-11773182/subnets/aks-subnet"
  aks_default_auto_scaling = "true"
  aks_default_pool_type = "VirtualMachineScaleSets" 
  aks_os_dist_type = "Managed"
  aks_os_disk_size = "128"
  log_analtyics_workspace_id_dr = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourcegroups/rgp-usw-core-dr-dv/providers/microsoft.operationalinsights/workspaces/law-use-dr-dv"
  application_acronym_aks = "dr"
  environment_acronym_aks = "dv"
  location_acronym_aks ="use"
}

aks_tags = {
  Environment = "Development-DR"
  LOB = "Advisory Other"
  Node = "Hub"
  Platform = "Azure Commercial Cloud"
  Solution = "Core"
}

aks_usw = {
  usw_node_resource_group = "MC_RGP-USW-CORE-DR-DV_aks-usw-dr-dv_westus"
  aks_rg_name = "RGP-USW-CORE-DR-DV"
  location = "West US"
  aks_version = "1.22.11"
  aks_default_node_pool_name = "agentpool"
  aks_default_node_count = "1"
  aks_default_max_count = "4"
  aks_default_min_count = "1"
  aks_default_node_size = "Standard_DS2_v2"
  aks_subnet_id = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.Network/virtualNetworks/vnt-usw-aks-dr-dv/subnets/default"
  aks_default_auto_scaling = "true"
  aks_default_pool_type = "VirtualMachineScaleSets" 
  aks_os_dist_type = "Managed"
  aks_os_disk_size = "128"
  log_analtyics_workspace_id_dr = "/subscriptions/da272037-3e65-4b59-b94c-b923105b56c5/resourceGroups/RGP-USW-CORE-DR-DV/providers/Microsoft.OperationalInsights/workspaces/law-usw-dr-dv"
  usw_application_acronym_aks = "dr"
  usw_environment_acronym_aks = "dv"
  usw_location_acronym_aks ="usw"
}
