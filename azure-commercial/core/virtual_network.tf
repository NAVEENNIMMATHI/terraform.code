############################
# East US Virtual Networks #
############################

resource "azurerm_virtual_network" "hub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-hub-vnet" : "vnt-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  address_space       = var.hub_vnet_address_space
  resource_group_name = azurerm_resource_group.hubvnet.name
  location            = azurerm_resource_group.hubvnet.location
  dns_servers         = var.environment_acronym == "dv" ? flatten([var.azure_firewall_private_ip,var.hub_vnet_dns_servers]) : var.hub_vnet_dns_servers

  tags = var.tags

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

# Digital Matrix Subnets
resource "azurerm_subnet" "dmappgateway" {
  name                 = "sub-${var.location_acronym}-dmappgateway-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_dmappgateway
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_subnet" "corease" {
  name                 = "sub-${var.location_acronym}-core-ase-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_dmase
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.AzureCosmosDB", "Microsoft.Web"]
}

resource "azurerm_subnet" "dmpe" {
  name                 = "sub-${var.location_acronym}-dmpe-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_dmpe
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus"]
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_subnet" "dmdfir" {
  name                 = "sub-${var.location_acronym}-dmdfir-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_dmdfir
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_subnet" "dmworkers" {
  name                 = "sub-${var.location_acronym}-dm-workers-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_dmworkers
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}



resource "azurerm_subnet" "bastion1" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-bastion1-subnet" : "sub-${var.location_acronym}-bastion1-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_bastion1
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.uemcbstn1.id
  # route_table_id            = azurerm_route_table.hubtopaloaltofw.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "rdgw" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-rdgw-subnet" : "sub-${var.location_acronym}-rdgw-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_rdgw
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.co-p-eastus-rdsgwhub-nsg.id
  # route_table_id            = azurerm_route_table.rdsgwhub.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "rdcbl" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-rdcbl-subnet" : "sub-${var.location_acronym}-rdcbl-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_rdcbl
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # route_table_id            = azurerm_route_table.rdsgwhub.id
  service_endpoints = ["Microsoft.Storage"]
  # network_security_group_id = azurerm_network_security_group.co-p-eastus-rdgcbhub-nsg.id
}

resource "azurerm_subnet" "infra1" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-infra1-subnet" : "sub-${var.location_acronym}-infra1-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_infra1
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.infra1.id
  # route_table_id            = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${lower(azurerm_resource_group.hubvnet.name)}/providers/Microsoft.Network/routeTables/${azurerm_route_table.hubtopaloaltofw.name}"
  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
}

resource "azurerm_subnet" "hybridworker" {
  name                 = "sub-${var.location_acronym}-hybridworker-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_hybridworker
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
}

# resource "azurerm_subnet" "aaddsvm" {
#   name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-aaddsvm-subnet" : "sub-${var.location_acronym}-aaddsvm-${var.environment_acronym}"
#   address_prefixes     = var.subnet_address_space_aad_ds_vm
#   virtual_network_name = azurerm_virtual_network.hub.name
#   resource_group_name  = azurerm_resource_group.hubvnet.name
#   # network_security_group_id = azurerm_network_security_group.UEMCAAD.id
#   # route_table_id            = azurerm_route_table.hubtopaloaltofw.id
#   service_endpoints = ["Microsoft.Storage"]
# }

resource "azurerm_subnet" "cyberarkpv" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-cyberarkpv-subnet" : "sub-${var.location_acronym}-cyberarkpv-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_cyberark_pv
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.cyberarkpvnsg.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "bastion2" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-bastion2-subnet" : "sub-${var.location_acronym}-bastion2-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_bastion2
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.uemcbstn2.id
  # route_table_id            = azurerm_route_table.hubtopaloaltofw.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "cyberarkpsm" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-cyberarkpsm-subnet" : "sub-${var.location_acronym}-cyberarkpsm-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_cyberark_psm
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.cyberarkpsmnsg.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "cyberarkcpm" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-cyberarkcpm-subnet" : "sub-${var.location_acronym}-cyberarkcpm-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_cyberark_cpm
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.cyberarkcpmnsg.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "cyberarkhtmlgw" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-cyberarkhtmlgw-subnet" : "sub-${var.location_acronym}-cyberarkhtmlgw-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_cyberark_html_gateway
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.cyberarkhtmlgw.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "app1" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-app1-subnet" : "sub-${var.location_acronym}-app1-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_app1
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.app1.id
  # route_table_id            = azurerm_route_table.hubtopaloaltofw.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "db1" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-db1-subnet" : "sub-${var.location_acronym}-db1-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_db1
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.db1.id
  # route_table_id            = azurerm_route_table.hubtopaloaltofw.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "secmgmt" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-secmgmt-subnet" : "sub-${var.location_acronym}-secmgmt-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_sec_mgmt
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # route_table_id       = azurerm_route_table.hubtopaloaltofw.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "ase1" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-ase1-subnet" : "sub-${var.location_acronym}-ase1-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_ase1
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = azurerm_network_security_group.ase1.id
  # route_table_id            = azurerm_route_table.hubtopaloaltofw.id
  service_endpoints = ["Microsoft.Storage"]
}

# this subnet is the same address space as the one below??
# resource "azurerm_subnet" "AAD-DSdomain" {
#   name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-AAD-DSdomain-subnet" : "sub-${var.location_acronym}-aaddsdomain-${var.environment_acronym}"
#   address_prefixes     = var.subnet_address_space_aad_ds_domain
#   virtual_network_name = azurerm_virtual_network.hub.name
#   resource_group_name  = azurerm_resource_group.hubvnet.name
#   # network_security_group_id = azurerm_network_security_group.AADDS-KCO_local-NSG.id
#   service_endpoints = ["Microsoft.Storage"]
# }

#resource "azurerm_subnet" "co-p-eastus-AAD-AD-DSdomain-subnet" {
#  name                      = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.environment_acronym}-${var.location}-AAD-DSdomain-subnet" : "sub-${var.location_acronym}-aadds-${var.environment_acronym}"
#  address_prefixes          = var.subnet_address_space_aad_ds_domain
#  resource_group_name       = azurerm_resource_group.hubvnet.name
#  virtual_network_name      = azurerm_virtual_network.hub.name
#  service_endpoints         = ["Microsoft.Storage"]
#  # network_security_group_id = azurerm_network_security_group.AADDS-KCO_local-NSG.id
#}

resource "azurerm_subnet" "co-p-eastus-rdssspr-subnet" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-rdssspr-subnet" : "sub-${var.location_acronym}-rdssspr-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_rdssspr_subnet
  resource_group_name  = azurerm_resource_group.hubvnet.name
  virtual_network_name = azurerm_virtual_network.hub.name
  # network_security_group_id = azurerm_network_security_group.co-p-eastus-rdssspr-nsg.id
  service_endpoints = ["Microsoft.Storage"]
}

# Firewall must use subnet with the name AzureFirewallSubnet
resource "azurerm_subnet" "azure-firewall-subnet" {
  name                 = "AzureFirewallSubnet"
  address_prefixes     = var.subnet_address_space_web1
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # network_security_group_id = ""
  # route_table_id            = ""
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "squidvmsubnet" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "squid-proxy-vm-subnet" : "sub-${var.location_acronym}-squidproxyvm-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_squid
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  # route_table_id       = azurerm_route_table.firewallroutetable.id
  # network_security_group_id = azurerm_network_security_group.squidnsg.id
  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
}

# resource "azurerm_subnet" "build-subnet" {
#   name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "build-subnet" : "sub-${var.location_acronym}-build-${var.environment_acronym}"
#   address_prefixes     = var.subnet_address_space_build
#   virtual_network_name = azurerm_virtual_network.hub.name
#   resource_group_name  = azurerm_resource_group.hubvnet.name
#   service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
# }

# Digital Matrix Subnets
resource "azurerm_subnet" "packer" {
  name                 = "sub-${var.location_acronym}-packer-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_packer
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
}

# Net App subnet
resource "azurerm_subnet" "netapp" {
  count    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? 1 : 0

  name                 = "sub-${var.location_acronym}-netapp-${var.environment_acronym}"
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  address_prefixes     = var.subnet_address_space_netapp

  delegation {
    name = "netapp"

    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

# AKS Subnet
/*
resource "azurerm_subnet" "aks" {}
resource "azurerm_subnet" "aks_agw" {}
*/
## Moved to Core-AKS folder ##


# PowerBI Subnet
resource "azurerm_subnet" "pbi1" {
    name                  = "sub-${var.location_acronym}-${var.application_acronym}-pbi1-${var.environment_acronym}"
    address_prefixes      = var.subnet_address_space_pbi1
    virtual_network_name  = azurerm_virtual_network.hub.name
    resource_group_name   = azurerm_resource_group.hubvnet.name
    service_endpoints     = ["Microsoft.Sql", "Microsoft.Storage"]

}

############################
# West US Virtual Networks #
############################

resource "azurerm_virtual_network" "wuhub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-westus-Hub-vnet" : "vnt-${var.location_dr_acronym}-${var.application_acronym}-${var.environment_acronym}"
  address_space       = var.wu_hub_vnet_address_space
  resource_group_name = azurerm_resource_group.wuhubvnet.name
  location            = azurerm_resource_group.wuhubvnet.location
  dns_servers         = var.environment_acronym == "dv" ? flatten([var.azure_firewall_private_ip,var.hub_vnet_dns_servers]) : var.hub_vnet_dns_servers


  tags = var.tags_dr

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

# sub-usw-aadds-pd
resource "azurerm_subnet" "aaddsusw" {
  count                = (var.environment_acronym == "pd") ?  1 : 0
  name                 = "sub-${var.location_dr_acronym}-aadds-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_wu_aadds
  virtual_network_name = azurerm_virtual_network.wuhub.name
  resource_group_name  = azurerm_resource_group.wuhubvnet.name
  # network_security_group_id = azurerm_network_security_group.wucyberarkpvnsg.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "wucyberarkcore" {
  name                 = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location_dr}-cyberarkcore-subnet" : "sub-${var.location_dr_acronym}-cyberarkcore-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_wu_cyberark_core
  virtual_network_name = azurerm_virtual_network.wuhub.name
  resource_group_name  = azurerm_resource_group.wuhubvnet.name
  # network_security_group_id = azurerm_network_security_group.wucyberarkpvnsg.id
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "sub_pvtendpnt_core" {
  name                 = "sub-${var.location_acronym}-pvtendpnt-core-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_pvtendpnt_core
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  enforce_private_link_endpoint_network_policies = true
 
  # This subnet is meant only for private endpoints
  # NSGs and service endpoints don't apply in this context
}

resource "azurerm_subnet" "build_agent" {
  name                 = "sub-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  address_prefixes     = var.subnet_address_space_build_cicd
  virtual_network_name = azurerm_virtual_network.hub.name
  resource_group_name  = azurerm_resource_group.hubvnet.name
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Sql"]
}

# dr hub vnet  vnt-usw-hub-dv
resource "azurerm_virtual_network" "drhubvnet" {
  name                = "vnt-${var.location_dr_acronym}-hub-${var.environment_acronym}" 
  address_space       = var.dr_hubvnet_address_space
  resource_group_name = azurerm_resource_group.drhubvnetrg.name
  location            = azurerm_resource_group.drhubvnetrg.location

  tags = var.tags_dr

  lifecycle {
    ignore_changes = [
      ddos_protection_plan
    ]
  }
}

# vnet peering
#EastUS RG: co-dv-eastus-hub-vnet
#VNET WestUS: vnt-usw-hub-dv
# vnt-usw-core-qa
# vnt-use-core-qa
# vnt-usw-core-uat
# vnt-use-core-uat

resource "azurerm_virtual_network_peering" "drhubvnetpeer" {
  count                     = var.environment_acronym == "dv" ? 1 : 0
  name                      = "vnt-${var.location_dr_acronym}-hub-${var.environment_acronym}-to-co-${var.environment_acronym}-${var.location}-hub-vnet"
  resource_group_name       = azurerm_resource_group.drhubvnetrg.name
  virtual_network_name      = azurerm_virtual_network.drhubvnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
}

resource "azurerm_virtual_network_peering" "hubvnetpeer" {
  count                     = var.environment_acronym == "dv" ? 1 : 0
  name                      = "co-${var.environment_acronym}-${var.location}-hub-vnet-to-vnt-${var.location_dr_acronym}-hub-${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.hubvnet.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.drhubvnet.id
}

resource "azurerm_virtual_network_peering" "wudrcorevnetpeer" {
  count                     = var.environment_acronym == "qa" ? 1 : 0
  name                      = "vnt-${var.location_dr_acronym}-core-${var.environment_acronym}-to-vnt-${var.location_acronym}-core-${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.wuhubvnet.name
  virtual_network_name      = azurerm_virtual_network.wuhub.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
}

resource "azurerm_virtual_network_peering" "corevnetpeer" {
  count                     = var.environment_acronym == "qa" ? 1 : 0
  name                      = "vnt-${var.location_acronym}-core-${var.environment_acronym}-to-vnt-${var.location_dr_acronym}-core-${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.hubvnet.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.wuhub.id
}

# Firewall must use subnet with the name AzureFirewallSubnet
resource "azurerm_subnet" "azure-firewall-subnet-dr" {

  name                 = "AzureFirewallSubnet"
  address_prefixes     = var.subnet_address_space_web1_dr
  virtual_network_name = azurerm_virtual_network.drhubvnet.name
  resource_group_name  = azurerm_resource_group.drhubvnetrg.name
  # network_security_group_id = ""
  # route_table_id            = ""
  service_endpoints = ["Microsoft.Storage"]
}
resource "azurerm_virtual_network_peering" "wudrcorevnetpeeruat" {
  count                     = var.environment_acronym == "uat" ? 1 : 0
  name                      = "vnt-${var.location_dr_acronym}-core-${var.environment_acronym}-to-vnt-${var.location_acronym}-core-${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.wuhubvnet.name
  virtual_network_name      = azurerm_virtual_network.wuhub.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
}

resource "azurerm_virtual_network_peering" "corevnetpeeruat" {
  count                     = var.environment_acronym == "uat" ? 1 : 0
  name                      = "vnt-${var.location_acronym}-core-${var.environment_acronym}-to-vnt-${var.location_dr_acronym}-core-${var.environment_acronym}"
  resource_group_name       = azurerm_resource_group.hubvnet.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.wuhub.id
}

