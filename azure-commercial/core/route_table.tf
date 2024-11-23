resource "azurerm_route_table" "internetthroughpalo" {
  name                          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-internetthroughpalo-udr" : "rtb-${var.location_acronym}-internetthroughpalo-${var.environment_acronym}"
  location                      = azurerm_resource_group.hubvnet.location
  resource_group_name           = azurerm_resource_group.hubvnet.name
  disable_bgp_route_propagation = false

  route {
    name                   = "AlltrafficthroughPalo"
    address_prefix         = "0.0.0.0/0"
    next_hop_in_ip_address = var.next_hop_in_ip_address_for_routetable_of_palo_alto
    next_hop_type          = "VirtualAppliance"
  }

  tags = var.tags_Networking
}

resource "azurerm_route_table" "hubtopaloaltofw" {
  name                          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-hubtopaloaltofw-udr" : "rtb-${var.location_acronym}-coretopaloaltofw-${var.environment_acronym}"
  location                      = azurerm_resource_group.hubvnet.location
  resource_group_name           = azurerm_resource_group.hubvnet.name
  disable_bgp_route_propagation = false

  route {
    name                   = "AlltrafficthroughPAFW"
    address_prefix         = "0.0.0.0/0"
    next_hop_in_ip_address = var.next_hop_in_ip_address_for_routetable_of_palo_alto
    next_hop_type          = "VirtualAppliance"
  }

  tags = var.tags_Networking
}

resource "azurerm_route_table" "firewallroutetable" {
  name                          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-azfirewall-udr" : "rtb-${var.location_acronym}-azfirewall-${var.environment_acronym}"
  location                      = azurerm_resource_group.hubvnet.location
  resource_group_name           = azurerm_resource_group.hubvnet.name
  disable_bgp_route_propagation = false

  route {
    name                   = "AlltrafficthroughPAFW"
    address_prefix         = "0.0.0.0/0"
    next_hop_in_ip_address = azurerm_firewall.firewall.ip_configuration.0.private_ip_address
    next_hop_type          = "VirtualAppliance"
  }

  tags = var.tags_Networking
}

resource "azurerm_route_table" "drfirewallroutetable" {
  count = (var.environment_acronym == "dv" || var.environment_acronym == "pd")  ? 1 : 0
  
  name                          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location_dr}-azfirewall-udr" : "rtb-${var.location_dr_acronym}-azfirewall-${var.environment_acronym}"
  location                      = azurerm_resource_group.drhubvnetrg.location
  resource_group_name           = azurerm_resource_group.drhubvnetrg.name
  disable_bgp_route_propagation = false

  tags = var.tags_dr_Networking
}

resource "azurerm_route_table" "core_ase_route_table" {
  name                          = "rtb-${var.location_acronym}-core-ase-${var.environment_acronym}"
  location                      = azurerm_resource_group.hubvnet.location
  resource_group_name           = azurerm_resource_group.hubvnet.name
  disable_bgp_route_propagation = false

  route {
    name                   = "to-Internet"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "Internet"
  }

  route {
    address_prefix         = var.smtp_ip_address
    name                   = "ASEtoSMTP"
    next_hop_in_ip_address = var.azure_firewall_private_ip
    next_hop_type          = "VirtualAppliance"
  }

  route {
    address_prefix         = var.epe_ip_address
    name                   = "AllowEPE"
    next_hop_in_ip_address = var.azure_firewall_private_ip
    next_hop_type          = "VirtualAppliance"
  }

  route {
    address_prefix         = "205.220.188.0/24"
    name                   = "ASEtoSMTPRelay"
    next_hop_in_ip_address = var.azure_firewall_private_ip
    next_hop_type          = "VirtualAppliance"
  }

  route {
    address_prefix         = "205.220.189.0/24"
    name                   = "ASEtoSMTPRelay1"
    next_hop_in_ip_address = var.azure_firewall_private_ip
    next_hop_type          = "VirtualAppliance"
  }

  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "ase" {
  subnet_id      = azurerm_subnet.corease.id
  route_table_id = azurerm_route_table.core_ase_route_table.id
}

resource "azurerm_subnet_route_table_association" "adf_to_firwall" {
  subnet_id      = azurerm_subnet.dmdfir.id
  route_table_id = azurerm_route_table.core_ase_route_table.id
}
# resource "azurerm_subnet_route_table_association" "ase_old" {
#   subnet_id      = azurerm_subnet.ase1.id
#   route_table_id = azurerm_route_table.core_ase_route_table.id
# }

resource "azurerm_subnet_route_table_association" "infra1" {
  subnet_id      = azurerm_subnet.infra1.id
  route_table_id = var.environment == "production" ? azurerm_route_table.hubtopaloaltofw.id : azurerm_route_table.firewallroutetable.id
}

resource "azurerm_subnet_route_table_association" "hybridworker" {
  subnet_id      = azurerm_subnet.hybridworker.id
  route_table_id = var.environment == "production" ? azurerm_route_table.hubtopaloaltofw.id : azurerm_route_table.firewallroutetable.id
}

resource "azurerm_subnet_route_table_association" "bastion2" {
  subnet_id      = azurerm_subnet.bastion2.id
  route_table_id = var.environment == "production" ? azurerm_route_table.hubtopaloaltofw.id : azurerm_route_table.firewallroutetable.id
}

resource "azurerm_subnet_route_table_association" "app1" {
  subnet_id      = azurerm_subnet.app1.id
  route_table_id = var.environment == "production" ? azurerm_route_table.hubtopaloaltofw.id : azurerm_route_table.firewallroutetable.id
}

resource "azurerm_subnet_route_table_association" "db1" {
  subnet_id      = azurerm_subnet.db1.id
  route_table_id = var.environment == "production" ? azurerm_route_table.hubtopaloaltofw.id : azurerm_route_table.firewallroutetable.id
}

resource "azurerm_subnet_route_table_association" "secmgmt" {
  subnet_id      = azurerm_subnet.secmgmt.id
  route_table_id = var.environment == "production" ? azurerm_route_table.hubtopaloaltofw.id : azurerm_route_table.firewallroutetable.id
}

# resource "azurerm_subnet_route_table_association" "build-subnet" {
#   subnet_id      = azurerm_subnet.build-subnet.id
#   route_table_id = var.environment == "production" ? azurerm_route_table.hubtopaloaltofw.id : azurerm_route_table.firewallroutetable.id
# }

resource "azurerm_subnet_route_table_association" "squidvmsubnet" {
  subnet_id      = azurerm_subnet.squidvmsubnet.id
  route_table_id = azurerm_route_table.firewallroutetable.id
}

resource "azurerm_subnet_route_table_association" "pbi1" {
  subnet_id      = azurerm_subnet.pbi1.id
  route_table_id = azurerm_route_table.firewallroutetable.id
}

resource "azurerm_route_table" "rdsgwhub" {
  name                          = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-rdsgwhub-udr" : "rtb-${var.location_acronym}-rdsgwcore-${var.environment_acronym}"
  location                      = azurerm_resource_group.hubvnet.location
  resource_group_name           = azurerm_resource_group.hubvnet.name
  disable_bgp_route_propagation = false

  route {
    name                   = var.environment == "production" ? "AlltrafficthroughPalo" : "AlltrafficthroughAzFirewall"
    address_prefix         = "0.0.0.0/0"
    next_hop_in_ip_address = var.environment == "production" ? var.next_hop_in_ip_address_for_routetable_of_palo_alto : azurerm_firewall.firewall.ip_configuration.0.private_ip_address
    next_hop_type          = "VirtualAppliance"
  }

  route {
    name           = "RDGWRoute_XoriantMum_1"
    address_prefix = "203.199.72.210/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_1"
    address_prefix = "199.207.253.0/24"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_2"
    address_prefix = "199.206.0.5/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforXoriantMum_2"
    address_prefix = "110.173.180.210/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforXoriantPun_1"
    address_prefix = "115.114.9.131/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforXoriantPun_2"
    address_prefix = "114.143.105.74/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Gurgaon"
    address_prefix = "103.216.201.96/28"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Bangalore"
    address_prefix = "103.58.118.216/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Bangalore1"
    address_prefix = "103.58.118.217/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Bangalore2"
    address_prefix = "103.58.118.218/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Bangalore3"
    address_prefix = "103.58.118.219/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Bangalore4"
    address_prefix = "103.58.118.215/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforCollaberaBLRSecondary"
    address_prefix = "42.104.67.226/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforCollaberaVPN"
    address_prefix = "66.246.63.23/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteForKPMGBangaloreSite1"
    address_prefix = "103.58.118.80/28"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKGS_BangaloreSite2"
    address_prefix = "103.133.112.80/28"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Bangalore_TATA"
    address_prefix = "1.244.129.34/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Bangalore_Airtel"
    address_prefix = "125.20.85.114/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteForKPMGBangaloreSite1_2"
    address_prefix = "103.58.118.96/27"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteForKPMGBangaloreSite1_3"
    address_prefix = "103.58.118.128/25"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforCollaberaVPN_2"
    address_prefix = "66.246.63.240/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Canada1"
    address_prefix = "72.142.87.71/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Canada2"
    address_prefix = "72.142.49.77/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Canada3"
    address_prefix = "204.50.172.132/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Canada4"
    address_prefix = "204.50.15.4/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Canada5"
    address_prefix = "99.229.128.42/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Mundivox1"
    address_prefix = "201.76.177.20/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Mundivox2"
    address_prefix = "201.76.177.30/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Mundivox3"
    address_prefix = "201.76.177.25/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Mundivox4"
    address_prefix = "187.16.120.222/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Mundivox5"
    address_prefix = "201.76.177.22/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Algar1"
    address_prefix = "177.69.198.30/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Algar2"
    address_prefix = "177.69.198.32/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Algar3"
    address_prefix = "177.69.198.41/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Algar4"
    address_prefix = "177.69.198.44/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Algar5"
    address_prefix = "177.69.198.70/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Australia"
    address_prefix = "163.116.192.118/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Algar6"
    address_prefix = "177.69.198.21/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Brazil_Algar7"
    address_prefix = "177.69.198.31/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Australia7"
    address_prefix = "14.203.69.26/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Australia6"
    address_prefix = "14.203.69.25/32"
    next_hop_type  = "Internet"
  } 

  route {
    name           = "RDGWRouteforKPMG_Australia5"
    address_prefix = "14.203.69.2/32"
    next_hop_type  = "Internet"
  } 

  route {
    name           = "RDGWRouteforKPMG_Australia4"
    address_prefix = "14.203.69.1/32"
    next_hop_type  = "Internet"
  } 

  route {
    name           = "RDGWRouteforKPMG_Australia3"
    address_prefix = "14.203.69.14/32"
    next_hop_type  = "Internet"
  } 

  route {
    name           = "RDGWRouteforKPMG_Australia2"
    address_prefix = "14.203.69.13/32"
    next_hop_type  = "Internet"
  }

  route {
    name           = "RDGWRouteforKPMG_Australia1"
    address_prefix = "203.30.92.0/22"
    next_hop_type  = "Internet"
  }

  tags = var.tags
}

resource "azurerm_subnet_route_table_association" "rdgw" {
  subnet_id      = azurerm_subnet.rdgw.id
  route_table_id = azurerm_route_table.rdsgwhub.id
}

resource "azurerm_subnet_route_table_association" "rdcbl" {
  subnet_id      = azurerm_subnet.rdcbl.id
  route_table_id = azurerm_route_table.rdsgwhub.id
}

resource "azurerm_subnet_route_table_association" "packer" {
  subnet_id      = azurerm_subnet.packer.id
  route_table_id = azurerm_route_table.firewallroutetable.id
}

/*
resource "azurerm_subnet_route_table_association" "aks" {}
*/
## Moved to Core-AKS folder ##

resource "azurerm_subnet_route_table_association" "dmworkers" {
  subnet_id      = azurerm_subnet.dmworkers.id
  route_table_id = azurerm_route_table.firewallroutetable.id
}
resource "azurerm_subnet_route_table_association" "build" {
  subnet_id      = azurerm_subnet.build_agent.id
  route_table_id = azurerm_route_table.firewallroutetable.id
}