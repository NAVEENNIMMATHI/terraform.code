###################################
# East US Network Security Groups #
###################################

resource "azurerm_network_security_group" "uemcbstn2" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-bastion2-nsg" : "nsg-${var.location_acronym}-bastion2-${var.environment_acronym}"
  location            = azurerm_resource_group.bstnhosts.location
  resource_group_name = azurerm_resource_group.bstnhosts.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "bastion2" {
  subnet_id                 = azurerm_subnet.bastion2.id
  network_security_group_id = azurerm_network_security_group.uemcbstn2.id
}

#6
# resource "azurerm_network_security_group" "UEMCAAD" {
#   name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-AAD-DSdomain-nsg" : "nsg-${var.location_acronym}-aaddsdomain-${var.environment_acronym}"
#   location            = azurerm_resource_group.aadds.location
#   resource_group_name = azurerm_resource_group.aadds.name

#   tags = var.tags
# }

# resource "azurerm_subnet_network_security_group_association" "aaddsvm" {
#   subnet_id                 = azurerm_subnet.aaddsvm.id
#   network_security_group_id = azurerm_network_security_group.UEMCAAD.id
# }

#7

resource "azurerm_network_security_group" "uemcbstn1" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-bastion1-nsg" : "nsg-${var.location_acronym}-bastion1-${var.environment_acronym}"
  location            = azurerm_resource_group.bstnhosts.location
  resource_group_name = azurerm_resource_group.bstnhosts.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "bastion1" {
  subnet_id                 = azurerm_subnet.bastion1.id
  network_security_group_id = azurerm_network_security_group.uemcbstn1.id
}

#9A
resource "azurerm_network_security_group" "infra1" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-infra1-nsg" : "nsg-${var.location_acronym}-infra1-${var.environment_acronym}"
  location            = azurerm_resource_group.opscore.location
  resource_group_name = azurerm_resource_group.opscore.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "infra1" {
  subnet_id                 = azurerm_subnet.infra1.id
  network_security_group_id = azurerm_network_security_group.infra1.id
}

#9B
resource "azurerm_network_security_group" "hybridworker" {
  name                = "nsg-${var.location_acronym}-hybridworker-${var.environment_acronym}"
  location            = azurerm_resource_group.opscore.location
  resource_group_name = azurerm_resource_group.opscore.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "hybridworker" {
  subnet_id                 = azurerm_subnet.hybridworker.id
  network_security_group_id = azurerm_network_security_group.hybridworker.id
}

#11
resource "azurerm_network_security_group" "db1" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-db1-nsg" : "nsg-${var.location_acronym}-db1-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "db1" {
  subnet_id                 = azurerm_subnet.db1.id
  network_security_group_id = azurerm_network_security_group.db1.id
}

#12
resource "azurerm_network_security_group" "ase1" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-ase1-nsg" : "nsg-${var.location_acronym}-ase1-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "ase1" {
  subnet_id                 = azurerm_subnet.ase1.id
  network_security_group_id = azurerm_network_security_group.ase1.id
}

#13
resource "azurerm_network_security_group" "web1" {
  count = var.environment_acronym == "qa" ? 0 : 1

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-web1-nsg" : "nsg-${var.location_acronym}-web1-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

#14
resource "azurerm_network_security_group" "app1" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-app1-nsg" : "nsg-${var.location_acronym}-app1-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "app1" {
  subnet_id                 = azurerm_subnet.app1.id
  network_security_group_id = azurerm_network_security_group.app1.id
}

#15
resource "azurerm_network_security_group" "co-p-eastus-rdgcbhub-nsg" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-rdgcbhub-nsg" : "nsg-${var.location_acronym}-rdgcbcore-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "rdcbl" {
  subnet_id                 = azurerm_subnet.rdcbl.id
  network_security_group_id = azurerm_network_security_group.co-p-eastus-rdgcbhub-nsg.id
}

#16
resource "azurerm_network_security_group" "co-p-eastus-rdsgwhub-nsg" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-rdsgwhub-nsg" : "nsg-${var.location_acronym}-rdsgwcore-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "rdgw" {
  subnet_id                 = azurerm_subnet.rdgw.id
  network_security_group_id = azurerm_network_security_group.co-p-eastus-rdsgwhub-nsg.id
}

#17
resource "azurerm_network_security_group" "co-p-eastus-rdssspr-nsg" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-rdssspr-nsg" : "nsg-${var.location_acronym}-rdssspr-${var.environment_acronym}"
  location            = azurerm_resource_group.mfa.location
  resource_group_name = azurerm_resource_group.mfa.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "co-p-eastus-rdssspr-subnet" {
  subnet_id                 = azurerm_subnet.co-p-eastus-rdssspr-subnet.id
  network_security_group_id = azurerm_network_security_group.co-p-eastus-rdssspr-nsg.id
}

#18
resource "azurerm_network_security_group" "UEMCSNOWNP1-nsg" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCSNOWNP1-nsg" : "nsg-${var.location_acronym}-snow-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags_SNOW
}

#19
# resource "azurerm_network_security_group" "AADDS-KCO_local-NSG" {
#   name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "AADDS-KCO.local-NSG" : "nsg-${var.location_acronym}-aadds-${var.environment_acronym}"
#   location            = azurerm_resource_group.aadds.location
#   resource_group_name = azurerm_resource_group.aadds.name

#   tags = var.tags
# }

# resource "azurerm_subnet_network_security_group_association" "AAD-DSdomain" {
#   subnet_id                 = azurerm_subnet.AAD-DSdomain.id
#   network_security_group_id = azurerm_network_security_group.AADDS-KCO_local-NSG.id
# }

resource "azurerm_network_security_group" "squidnsg" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "squidnsggroup" : "nsg-${var.location_acronym}-squid-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags_Networking
}

resource "azurerm_subnet_network_security_group_association" "squidvmsubnet" {
  subnet_id                 = azurerm_subnet.squidvmsubnet.id
  network_security_group_id = azurerm_network_security_group.squidnsg.id
}


resource "azurerm_network_security_group" "panoramansg" {
  count = var.environment_acronym == "qa" ? 0 : 1
  
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-panorama-nsg" : "nsg-${var.location_acronym}-panorama-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.panorama.name
  location            = azurerm_resource_group.panorama.location

  tags = var.tags_Networking
}

# resource "azurerm_network_security_group" "build-nsg" {
#   name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "nsg-build" : "nsg-${var.location_acronym}-build-${var.environment_acronym}"
#   resource_group_name = azurerm_resource_group.hubvnet.name
#   location            = azurerm_resource_group.hubvnet.location

#   tags = var.tags
# }

# resource "azurerm_subnet_network_security_group_association" "build-subnet" {
#   subnet_id                 = azurerm_subnet.build-subnet.id
#   network_security_group_id = azurerm_network_security_group.build-nsg.id
# }

resource "azurerm_network_security_group" "packer" {
  name                = "nsg-${var.location_acronym}-packer-${var.environment_acronym}"
  location            = azurerm_resource_group.packer.location
  resource_group_name = azurerm_resource_group.packer.name

  tags = var.tags_NodeMgmt
}

resource "azurerm_subnet_network_security_group_association" "packer" {
  subnet_id                 = azurerm_subnet.packer.id
  network_security_group_id = azurerm_network_security_group.packer.id
}

/*
resource "azurerm_network_security_group" "aks" {}
resource "azurerm_subnet_network_security_group_association" "aks" {}
*/
## Moved to Core-AKS folder ##

resource "azurerm_network_security_group" "pbi1" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-pbi1-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags                = var.tags_GatewayServices
}

resource "azurerm_subnet_network_security_group_association" "pbi1" {
  subnet_id                 = azurerm_subnet.pbi1.id
  network_security_group_id = azurerm_network_security_group.pbi1.id
}


## DM
resource "azurerm_network_security_group" "dm_ase" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-dm-ase-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "dm_ase" {
  subnet_id                 = azurerm_subnet.corease.id
  network_security_group_id = azurerm_network_security_group.dm_ase.id
}

resource "azurerm_network_security_group" "dm_app_gateway" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-dm-app-gateway-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "dm_app_gateway" {
  subnet_id                 = azurerm_subnet.dmappgateway.id
  network_security_group_id = azurerm_network_security_group.dm_app_gateway.id
}

resource "azurerm_network_security_group" "dm_pep" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-dm-pep-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "dm_pep" {
  subnet_id                 = azurerm_subnet.dmpe.id
  network_security_group_id = azurerm_network_security_group.dm_pep.id
}

resource "azurerm_network_security_group" "dm_dtf" {
  name                = "nsg-${var.location_acronym}-${var.application_acronym}-dm-dtf-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "dm_dtf" {
  subnet_id                 = azurerm_subnet.dmdfir.id
  network_security_group_id = azurerm_network_security_group.dm_dtf.id
}

/*
resource "azurerm_network_security_group" "aks_agw" {}
resource "azurerm_subnet_network_security_group_association" "aks_agw" {}
*/
## Moved to Core-AKS folder ##

resource "azurerm_network_security_group" "dmworkers" {
  name                = "nsg-${var.location_acronym}-dm-workers-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "dmworkers" {
  subnet_id                 = azurerm_subnet.dmworkers.id
  network_security_group_id = azurerm_network_security_group.dmworkers.id
}

###################################
# West US Network Security Groups #
###################################

resource "azurerm_network_security_group" "build" {
  name                = "nsg-${var.location_acronym}-build-${var.environment_acronym}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name
  tags = var.tags_BuildAgent
}
resource "azurerm_subnet_network_security_group_association" "build" {
  subnet_id                 = azurerm_subnet.build_agent.id
  network_security_group_id = azurerm_network_security_group.build.id
}