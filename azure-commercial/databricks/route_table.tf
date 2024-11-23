resource "azurerm_route_table" "routetable" {
  name                          = var.environment == "p" ? "co-p-eastus-databricks-udr" : "rtb-${var.location_acronym}-${var.project_acronym}-${var.environment_acronym}"
  resource_group_name           = module.databricksrg.resource_group_name
  location                      = module.databricksrg.resource_group_location
  disable_bgp_route_propagation = false

  ## Control Plane ##

  route {
    name                        = var.environment == "p" ? "databrickscptopalo" : "databricks-cp-to-firewall"
    address_prefix              = "23.101.152.95/32"
    next_hop_type               = "Internet"
  }
   ## Web App ##

  route {
    name                        = var.environment == "p" ? "databrickswebapptopalo" : "databricks-web-to-firewall"
    address_prefix              = "40.70.58.221/32"
    next_hop_type               = "Internet"
  }

  route {
    #name                        = var.environment == "p" ? "OutboundTraffictoPaloAlto" : "OutboundTraffictoFirewall"
    name                       = "OutboundTraffictoFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    #next_hop_in_ip_address      = var.environment == "p" ? var.palo_alto_ip_address : var.azfirewall_ip_address
    next_hop_in_ip_address      = var.azfirewall_ip_address
  }

 
  route {
    name                        = "databricks-web-to-firewall2"
    address_prefix              = "20.42.4.209/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-web-to-firewall3"
    address_prefix              = "20.42.4.211/32"
    next_hop_type               = "Internet"
  }

  
    route {
    name                        = "databricks-cp-to-firewall2"
    address_prefix              = "20.42.4.208/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-cp-to-firewall3"
    address_prefix              = "20.42.4.210/32"
    next_hop_type               = "Internet"
  }

  ## SCC Relay ##

  route {
    name                        = "databricks-scc-relay"
    address_prefix              = "52.247.0.200/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-scc-relay2"
    address_prefix              = "20.186.83.56/32"
    next_hop_type               = "Internet"
  }

  ## Extended Infrastructure ##

  route {
    name                        = "databricks-extended-infrastructure"
    address_prefix              = "20.57.106.0/28"
    next_hop_type               = "Internet"
  }

  ## MetaStore ##

  route {
    name                        = "databricks-metastore"
    address_prefix              = "40.121.158.30/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-metastore2"
    address_prefix              = "40.71.8.203/32"
    next_hop_type               = "Internet"
  }

  ## Databricks Local Storage ##

  route {
    name                        = "databricks-storage-blob-mnz22prdstr04a"
    address_prefix              = "52.239.221.100/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-storage-dfs-mnz22prdstr04a"
    address_prefix              = "52.239.221.98/32"
    next_hop_type               = "Internet"
  }

  ## Artifact Blob Storage Primary ##

  route {
    name                        = "databricks-primary-blob-blz23prdstrz01a"
    address_prefix              = "52.239.170.4/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-primary-blob-blaprdstr05a"
    address_prefix              = "52.239.154.100/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-primary-blob-mnz22prdstr01a"
    address_prefix              = "52.239.221.68/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-primary-blob-blz23prdstr07a"
    address_prefix              = "20.60.134.228/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-primary-blob-mnz20prdstr01a"
    address_prefix              = "52.239.246.4/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-primary-blob-bl6prdstr13a"
    address_prefix              = "52.239.152.234/32"
    next_hop_type               = "Internet"
  }

  ## Artifact Blob Storage Secondary ##

  route {
    name                        = "databricks-secondary-blob-bz6prdstr05a"
    address_prefix              = "13.77.115.36/32"
    next_hop_type               = "Internet"
  }

  ## Log Blob Storage ##

  route {
    name                        = "databricks-log-west-blob-blz21prdstrz04a"
    address_prefix              = "20.150.34.228/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-log-east-blob-blz21prdstrz04a"
    address_prefix              = "20.60.6.36/32"
    next_hop_type               = "Internet"
  }

  ## Event Hub Endpoint ##

  route {
    name                        = "databricks-eventhub-west"
    address_prefix              = "40.112.242.0/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "databricks-eventhub-east"
    address_prefix              = "40.71.10.128/32"
    next_hop_type               = "Internet"
  }

  tags = var.tags
}

resource "azurerm_route_table" "routetablesqlmi" {
  name                          = var.environment == "p" ? "co-p-eastus-sql-mi-udr" : "rtb-${var.location_acronym}-${var.project_acronym}-${var.security_role_sql_managed_instance}-${var.environment_acronym}"
  resource_group_name           = module.databricksrg.resource_group_name
  location                      = module.databricksrg.resource_group_location
  disable_bgp_route_propagation = false
  tags                          = var.tags

  route {
    #name                   = var.environment == "p" ? "OutboundTraffictoPaloAlto" : "OutboundTraffictoFirewall"
    name                   = "OutboundTraffictoFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    #next_hop_in_ip_address = var.environment == "p" ? var.palo_alto_ip_address : var.azfirewall_ip_address
    next_hop_in_ip_address = var.azfirewall_ip_address
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_subnet-to-vnetlocal"
    address_prefix = var.environment == "p" ? "10.32.1.192/26" : "10.51.33.192/26"
    next_hop_type  = "VnetLocal"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-13-64-11-nexthop-internet"
    address_prefix = "13.64.0.0/11"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-13-104-14-nexthop-internet"
    address_prefix = "13.104.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-34-15-nexthop-internet"
    address_prefix = "20.34.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-36-14-nexthop-internet"
    address_prefix = "20.36.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-40-13-nexthop-internet"
    address_prefix = "20.40.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-128-16-nexthop-internet"
    address_prefix = "20.128.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-140-15-nexthop-internet"
    address_prefix = "20.140.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-144-14-nexthop-internet"
    address_prefix = "20.144.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-150-15-nexthop-internet"
    address_prefix = "20.150.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-160-12-nexthop-internet"
    address_prefix = "20.160.0.0/12"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-176-14-nexthop-internet"
    address_prefix = "20.176.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-180-14-nexthop-internet"
    address_prefix = "20.180.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-184-13-nexthop-internet"
    address_prefix = "20.184.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-40-64-10-nexthop-internet"
    address_prefix = "40.64.0.0/10"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-4-15-nexthop-internet"
    address_prefix = "51.4.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-8-16-nexthop-internet"
    address_prefix = "51.8.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-10-15-nexthop-internet"
    address_prefix = "51.10.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-18-16-nexthop-internet"
    address_prefix = "51.18.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-51-16-nexthop-internet"
    address_prefix = "51.51.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-53-16-nexthop-internet"
    address_prefix = "51.53.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-103-16-nexthop-internet"
    address_prefix = "51.103.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-104-15-nexthop-internet"
    address_prefix = "51.104.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-132-16-nexthop-internet"
    address_prefix = "51.132.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-136-15-nexthop-internet"
    address_prefix = "51.136.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-138-16-nexthop-internet"
    address_prefix = "51.138.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-140-14-nexthop-internet"
    address_prefix = "51.140.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-144-15-nexthop-internet"
    address_prefix = "51.144.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-96-12-nexthop-internet"
    address_prefix = "52.96.0.0/12"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-112-14-nexthop-internet"
    address_prefix = "52.112.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-125-16-nexthop-internet"
    address_prefix = "52.125.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-126-15-nexthop-internet"
    address_prefix = "52.126.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-130-15-nexthop-internet"
    address_prefix = "52.130.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-132-14-nexthop-internet"
    address_prefix = "52.132.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-136-13-nexthop-internet"
    address_prefix = "52.136.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-145-16-nexthop-internet"
    address_prefix = "52.145.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-146-15-nexthop-internet"
    address_prefix = "52.146.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-148-14-nexthop-internet"
    address_prefix = "52.148.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-152-13-nexthop-internet"
    address_prefix = "52.152.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-160-11-nexthop-internet"
    address_prefix = "52.160.0.0/11"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-52-224-11-nexthop-internet"
    address_prefix = "52.224.0.0/11"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-64-4-18-nexthop-internet"
    address_prefix = "64.4.0.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-65-52-14-nexthop-internet"
    address_prefix = "65.52.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-66-119-144-20-nexthop-internet"
    address_prefix = "66.119.144.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-70-37-17-nexthop-internet"
    address_prefix = "70.37.0.0/17"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-70-37-128-18-nexthop-internet"
    address_prefix = "70.37.128.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-91-190-216-21-nexthop-internet"
    address_prefix = "91.190.216.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-94-245-64-18-nexthop-internet"
    address_prefix = "94.245.64.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-103-9-8-22-nexthop-internet"
    address_prefix = "103.9.8.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-103-25-156-24-nexthop-internet"
    address_prefix = "103.25.156.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-103-25-157-24-nexthop-internet"
    address_prefix = "103.25.157.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-103-25-158-23-nexthop-internet"
    address_prefix = "103.25.158.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-103-36-96-22-nexthop-internet"
    address_prefix = "103.36.96.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-103-255-140-22-nexthop-internet"
    address_prefix = "103.255.140.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-104-40-13-nexthop-internet"
    address_prefix = "104.40.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-104-146-15-nexthop-internet"
    address_prefix = "104.146.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-104-208-13-nexthop-internet"
    address_prefix = "104.208.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-111-221-16-20-nexthop-internet"
    address_prefix = "111.221.16.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-111-221-64-18-nexthop-internet"
    address_prefix = "111.221.64.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-129-75-16-nexthop-internet"
    address_prefix = "129.75.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-1-24-nexthop-internet"
    address_prefix = "131.253.1.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-3-24-nexthop-internet"
    address_prefix = "131.253.3.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-5-24-nexthop-internet"
    address_prefix = "131.253.5.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-6-24-nexthop-internet"
    address_prefix = "131.253.6.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-8-24-nexthop-internet"
    address_prefix = "131.253.8.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-12-22-nexthop-internet"
    address_prefix = "131.253.12.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-16-23-nexthop-internet"
    address_prefix = "131.253.16.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-18-24-nexthop-internet"
    address_prefix = "131.253.18.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-21-24-nexthop-internet"
    address_prefix = "131.253.21.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-22-23-nexthop-internet"
    address_prefix = "131.253.22.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-24-21-nexthop-internet"
    address_prefix = "131.253.24.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-32-20-nexthop-internet"
    address_prefix = "131.253.32.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-61-24-nexthop-internet"
    address_prefix = "131.253.61.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-62-23-nexthop-internet"
    address_prefix = "131.253.62.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-64-18-nexthop-internet"
    address_prefix = "131.253.64.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-253-128-17-nexthop-internet"
    address_prefix = "131.253.128.0/17"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-132-245-16-nexthop-internet"
    address_prefix = "132.245.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-134-170-16-nexthop-internet"
    address_prefix = "134.170.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-134-177-16-nexthop-internet"
    address_prefix = "134.177.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-137-116-15-nexthop-internet"
    address_prefix = "137.116.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-137-135-16-nexthop-internet"
    address_prefix = "137.135.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-138-91-16-nexthop-internet"
    address_prefix = "138.91.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-138-196-16-nexthop-internet"
    address_prefix = "138.196.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-139-217-16-nexthop-internet"
    address_prefix = "139.217.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-139-219-16-nexthop-internet"
    address_prefix = "139.219.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-141-251-16-nexthop-internet"
    address_prefix = "141.251.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-146-147-16-nexthop-internet"
    address_prefix = "146.147.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-147-243-16-nexthop-internet"
    address_prefix = "147.243.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-150-171-16-nexthop-internet"
    address_prefix = "150.171.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-150-242-48-22-nexthop-internet"
    address_prefix = "150.242.48.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-157-54-15-nexthop-internet"
    address_prefix = "157.54.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-157-56-14-nexthop-internet"
    address_prefix = "157.56.0.0/14"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-157-60-16-nexthop-internet"
    address_prefix = "157.60.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-167-220-16-nexthop-internet"
    address_prefix = "167.220.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-168-61-16-nexthop-internet"
    address_prefix = "168.61.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-168-62-15-nexthop-internet"
    address_prefix = "168.62.0.0/15"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-191-232-13-nexthop-internet"
    address_prefix = "191.232.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-192-32-16-nexthop-internet"
    address_prefix = "192.32.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-192-48-225-24-nexthop-internet"
    address_prefix = "192.48.225.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-192-84-159-24-nexthop-internet"
    address_prefix = "192.84.159.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-192-84-160-23-nexthop-internet"
    address_prefix = "192.84.160.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-192-197-157-24-nexthop-internet"
    address_prefix = "192.197.157.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-193-149-64-19-nexthop-internet"
    address_prefix = "193.149.64.0/19"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-193-221-113-24-nexthop-internet"
    address_prefix = "193.221.113.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-194-69-96-19-nexthop-internet"
    address_prefix = "194.69.96.0/19"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-194-110-197-24-nexthop-internet"
    address_prefix = "194.110.197.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-198-105-232-22-nexthop-internet"
    address_prefix = "198.105.232.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-198-200-130-24-nexthop-internet"
    address_prefix = "198.200.130.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-198-206-164-24-nexthop-internet"
    address_prefix = "198.206.164.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-199-60-28-24-nexthop-internet"
    address_prefix = "199.60.28.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-199-74-210-24-nexthop-internet"
    address_prefix = "199.74.210.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-199-103-90-23-nexthop-internet"
    address_prefix = "199.103.90.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-199-103-122-24-nexthop-internet"
    address_prefix = "199.103.122.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-199-242-32-20-nexthop-internet"
    address_prefix = "199.242.32.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-199-242-48-21-nexthop-internet"
    address_prefix = "199.242.48.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-202-89-224-20-nexthop-internet"
    address_prefix = "202.89.224.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-13-120-21-nexthop-internet"
    address_prefix = "204.13.120.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-14-180-22-nexthop-internet"
    address_prefix = "204.14.180.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-135-24-nexthop-internet"
    address_prefix = "204.79.135.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-179-24-nexthop-internet"
    address_prefix = "204.79.179.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-181-24-nexthop-internet"
    address_prefix = "204.79.181.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-188-24-nexthop-internet"
    address_prefix = "204.79.188.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-195-24-nexthop-internet"
    address_prefix = "204.79.195.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-196-23-nexthop-internet"
    address_prefix = "204.79.196.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-252-24-nexthop-internet"
    address_prefix = "204.79.252.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-152-18-23-nexthop-internet"
    address_prefix = "204.152.18.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-152-140-23-nexthop-internet"
    address_prefix = "204.152.140.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-192-24-nexthop-internet"
    address_prefix = "204.231.192.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-194-23-nexthop-internet"
    address_prefix = "204.231.194.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-197-24-nexthop-internet"
    address_prefix = "204.231.197.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-198-23-nexthop-internet"
    address_prefix = "204.231.198.0/23"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-200-21-nexthop-internet"
    address_prefix = "204.231.200.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-208-20-nexthop-internet"
    address_prefix = "204.231.208.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-231-236-24-nexthop-internet"
    address_prefix = "204.231.236.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-205-174-224-20-nexthop-internet"
    address_prefix = "205.174.224.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-206-138-168-21-nexthop-internet"
    address_prefix = "206.138.168.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-206-191-224-19-nexthop-internet"
    address_prefix = "206.191.224.0/19"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-207-46-16-nexthop-internet"
    address_prefix = "207.46.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-207-68-128-18-nexthop-internet"
    address_prefix = "207.68.128.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-208-68-136-21-nexthop-internet"
    address_prefix = "208.68.136.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-208-76-44-22-nexthop-internet"
    address_prefix = "208.76.44.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-208-84-21-nexthop-internet"
    address_prefix = "208.84.0.0/21"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-209-240-192-19-nexthop-internet"
    address_prefix = "209.240.192.0/19"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-213-199-128-18-nexthop-internet"
    address_prefix = "213.199.128.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-216-32-180-22-nexthop-internet"
    address_prefix = "216.32.180.0/22"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-216-220-208-20-nexthop-internet"
    address_prefix = "216.220.208.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-33-16-nexthop-internet"
    address_prefix = "20.33.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-48-12-nexthop-internet"
    address_prefix = "20.48.0.0/12"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-64-10-nexthop-internet"
    address_prefix = "20.64.0.0/10"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-135-16-nexthop-internet"
    address_prefix = "20.135.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-136-16-nexthop-internet"
    address_prefix = "20.136.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-143-16-nexthop-internet"
    address_prefix = "20.143.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-20-192-10-nexthop-internet"
    address_prefix = "20.192.0.0/10"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-131-107-16-nexthop-internet"
    address_prefix = "131.107.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-167-105-16-nexthop-internet"
    address_prefix = "167.105.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-23-96-13-nexthop-internet"
    address_prefix = "23.96.0.0/13"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-42-159-16-nexthop-internet"
    address_prefix = "42.159.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-13-17-nexthop-internet"
    address_prefix = "51.13.0.0/17"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-107-16-nexthop-internet"
    address_prefix = "51.107.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-116-16-nexthop-internet"
    address_prefix = "51.116.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-120-16-nexthop-internet"
    address_prefix = "51.120.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-120-128-17-nexthop-internet"
    address_prefix = "51.120.128.0/17"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-51-124-16-nexthop-internet"
    address_prefix = "51.124.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-102-37-18-nexthop-internet"
    address_prefix = "102.37.0.0/18"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-102-133-16-nexthop-internet"
    address_prefix = "102.133.0.0/16"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-199-30-16-20-nexthop-internet"
    address_prefix = "199.30.16.0/20"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-204-79-180-24-nexthop-internet"
    address_prefix = "204.79.180.0/24"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-Storage"
    address_prefix = "Storage"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-SqlManagement"
    address_prefix = "SqlManagement"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-AzureMonitor"
    address_prefix = "AzureMonitor"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-CorpNetSaw"
    address_prefix = "CorpNetSaw"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-CorpNetPublic"
    address_prefix = "CorpNetPublic"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-AzureCloud.eastus"
    address_prefix = "AzureCloud.eastus"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-AzureCloud.westus"
    address_prefix = "AzureCloud.westus"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-Storage.eastus"
    address_prefix = "Storage.eastus"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-Storage.westus"
    address_prefix = "Storage.westus"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-EventHub.eastus"
    address_prefix = "EventHub.eastus"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-EventHub.westus"
    address_prefix = "EventHub.westus"
    next_hop_type  = "Internet"
  }
  route {
    name           = "Microsoft.Sql-managedInstances_UseOnly_mi-AzureActiveDirectory"
    address_prefix = "AzureActiveDirectory"
    next_hop_type  = "Internet"
  }
}