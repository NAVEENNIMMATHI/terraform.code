resource "azurerm_route_table" "aseroutetable" {
  
  name                          = var.environment == "production" ? "co-pd-eastus-kipase-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-ase-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = "ase-smtp-traffic-to-paloalto"
    address_prefix              = "199.207.144.9/32"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      =  var.azfirewall_ip_address
  }

  route {
    name                        = "ase-traffic-to-internet"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "Internet"
  }

  tags                          = var.tags
}

resource "azurerm_route_table" "miroutetable" {
  name                          = var.environment == "production" ? "co-pd-eastus-kipmi-udr" : "rtb-${var.location_acronym}-${var.application_acronym}-mi-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  tags                          = var.tags
}

resource "azurerm_route_table" "kiptoPaloAlto" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-firewall-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = var.environment=="production" ? "OutboundTraffictoPaloAlto" : "OutboundTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.environment=="production" ? var.PaloInboundIPAddress : var.azfirewall_ip_address
  }

  tags                          = var.tags
  
}

# only uses azure firewall
resource "azurerm_route_table" "dbws_route_table" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-dbws-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      = var.azfirewall_ip_address
  }
  route {
    name                        = "Control_plane_NAT_IP_Range1"
    address_prefix              = "23.101.152.95/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "Control_plane_NAT_IP_Range2"
    address_prefix              = "20.42.4.208/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "webapp_IP_range1"
    address_prefix              = "40.70.58.221/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "webapp_IP_range2"
    address_prefix              = "20.42.4.209/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "scc_relay_IP_range1"
    address_prefix              = "52.247.0.200/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "scc_relay_IP_range2"
    address_prefix              = "20.186.83.56/32"
    next_hop_type               = "Internet"
  }
  
  ##MetaStore##

  route {
    name                        = "metastore_IP_range1"
    address_prefix              = "40.121.158.30/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "metastore_IP_range2"
    address_prefix              = "40.71.8.203/32"
    next_hop_type               = "Internet"
  }

  ##Artifact Blob storage primary##
   route {
    name                        = "blob_blz23prdstrz01a_range1"
    address_prefix              = "52.239.169.196/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz23prdstrz01a_range2"
    address_prefix              = "52.239.170.4/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz23prdstrz01a_range3"
    address_prefix              = "52.239.169.164/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blaprdstr02a_range"
    address_prefix              = "52.239.153.36/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz22prdstr09a_range"  #DBFS is Included in this route
    address_prefix              = "52.239.170.100/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz21prdstr02a_range"
    address_prefix              = "52.239.169.4/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz22prdstr01a_range"
    address_prefix              = "52.239.155.132/32"
    next_hop_type               = "Internet"
  }

  ##Artifact Blob storage secondary##
  route {
    name                        = "blob_bz6prdstr05a_range"
    address_prefix              = "13.77.115.36/32"
    next_hop_type               = "Internet"
  }

  ##Log Blob storage##
  route {
    name                        = "blob_blz21prdstrz04a_range1"
    address_prefix              = "20.150.34.228/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz21prdstrz04a_range2"
    address_prefix              = "20.60.6.36/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz21prdstrz04a_range3"
    address_prefix              = "20.150.90.196/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "blob_blz21prdstrz04a_range4"
    address_prefix              = "20.150.90.228/32"
    next_hop_type               = "Internet"
  }

  ##Event Hub endpoint##
  route {
    name                        = "eventhub_ip_range1"
    address_prefix              = "40.112.242.0/32"
    next_hop_type               = "Internet"
  }
  route {
    name                        = "eventhub_ip_range2"
    address_prefix              = "40.71.10.128/32"
    next_hop_type               = "Internet"
  }

  ##WebApp and ControlPane##

  route {
  name                          = "dbws-firewall_route1"
  address_prefix                = "68.233.45.146/32"
  next_hop_type                 = "Internet"
  }       
        
  route {       
  name                          = "dbws-firewall_route2"
  address_prefix                = "64.225.34.103/32"
  next_hop_type                 = "Internet"
  }       
        
  route {       
  name                          = "dbws-firewall_route3"
  address_prefix                = "91.189.94.4/32"
  next_hop_type                 = "Internet"
  }       
        
  route {        
  name                          = "dbws-firewall_route4"
  address_prefix                = "69.164.198.192/32"
  next_hop_type                 = "Internet"
  }       
        
  route {       
  name                          = "dbws_firewall_route5"
  address_prefix                = "82.219.4.30/32"
  next_hop_type                 = "VirtualNetworkGateway"
  }       
        
  route {       
  name                          = "webapp_route"
  address_prefix                = "20.42.4.211/32"
  next_hop_type                 = "Internet"
  }       
        
  route {        
  name                          = "control_plane_nat_route"
  address_prefix                = "20.42.4.210/32"
  next_hop_type                 = "Internet"
  }

  tags                          = var.tags
  
}


resource "azurerm_route_table" "kiptoAzureFirewall" {
  name                          = "rtb-${var.location_acronym}-${var.application_acronym}-azfw-${var.environment_acronym}"
  location                      = module.applicationrg.resource_group_location
  resource_group_name           = module.applicationrg.resource_group_name
  disable_bgp_route_propagation = false

  route {
    name                        = "OutboundTraffictoAzureFirewall"
    address_prefix              = "0.0.0.0/0"
    next_hop_type               = "VirtualAppliance"
    next_hop_in_ip_address      =  var.azfirewall_ip_address
  }

  tags                          = var.tags
  
}
