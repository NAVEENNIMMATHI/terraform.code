# resource "azurerm_public_ip" "aadspip" {
#   name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "aadds-f483e5cf3afa462687c4bfb3186f7deb-pip${var.unique_variable_suffix}" : "pip-alb-${var.location_acronym}-int-aadds-${var.environment_acronym}"
#   resource_group_name = azurerm_resource_group.aadds.name
#   location            = azurerm_resource_group.aadds.location
#   sku                 = "Basic"
#   allocation_method   = "Dynamic"
#   domain_name_label   = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "cust-k-c-o-0-l-o-c-a-l-f483e5cf-3afa-4626-87c4-bfb3186f7deb${var.unique_variable_suffix}" : "cust-k-c-o-0-l-o-c-a-l-${var.environment_acronym}"

#   tags = var.tags
# }

resource "azurerm_public_ip" "rdsgwnlbpip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-NP-eastus-RDSGW-EXTERNAL-nlb-ip${var.unique_variable_suffix}" : "pip-alb-${var.location_acronym}-ext-rdsgw-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.rds.name
  location            = azurerm_resource_group.rds.location
  sku                 = "Basic"
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_public_ip" "rdsgwhubpip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${upper(var.legacy_env_acronym)}-${var.location}-RDSGWHub-pip${var.unique_variable_suffix}" : "pip-alb-${var.location_acronym}-ext-rdsgwcore-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.wuhubvnet.name
  location            = var.location # location is eastus in all environments even though the resource group location is westus
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_public_ip" "pslinpip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCOPSLIN1NP1-ip${var.unique_variable_suffix}" : "pip-VMLUSEOPS1${upper(var.environment_acronym)}"
  resource_group_name = azurerm_resource_group.opscore.name
  location            = azurerm_resource_group.opscore.location
  sku                 = "Basic"
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_public_ip" "rdsssprpip" {
  count = var.environment_acronym == "dv" ? 0 : 1
  
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${upper(var.legacy_env_acronym)}-${upper(var.location)}-RDSSSPR-GW-ip${var.unique_variable_suffix}" : "pip-${local.app_gateway_name}"
  resource_group_name = azurerm_resource_group.mfa.name
  location            = azurerm_resource_group.mfa.location
  sku                 = "Basic"
  allocation_method   = "Dynamic"

  tags = var.tags
}

resource "azurerm_public_ip" "bastion1pip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${local.bastion1vm_name}-pip${var.unique_variable_suffix}" : "pip-${local.bastion1vm_name}"
  resource_group_name = azurerm_resource_group.bstnhosts.name
  location            = azurerm_resource_group.bstnhosts.location
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_public_ip" "bastion2pip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${local.bastion2vm_name}-pip${var.unique_variable_suffix}" : "pip-${local.bastion2vm_name}"
  resource_group_name = azurerm_resource_group.bstnhosts.name
  location            = azurerm_resource_group.bstnhosts.location
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_public_ip" "bastion3pip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${local.bastion3vm_name}-pip${var.unique_variable_suffix}" : "pip-${local.bastion3vm_name}"
  resource_group_name = azurerm_resource_group.bstnhosts.name
  location            = azurerm_resource_group.bstnhosts.location
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_public_ip" "bastion4pip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${local.bastion4vm_name}-pip${var.unique_variable_suffix}" : "pip-${local.bastion4vm_name}"
  resource_group_name = azurerm_resource_group.bstnhosts.name
  location            = azurerm_resource_group.bstnhosts.location
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_public_ip" "snowpip" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCSNOWNP1-ip${var.unique_variable_suffix}" : "pip-${local.snowvm_name}"
  resource_group_name = azurerm_resource_group.hubvnet.name
  location            = azurerm_resource_group.hubvnet.location
  sku                 = "Basic"
  allocation_method   = var.snowpip_allocation_method

  tags = var.tags_SNOW
}

resource "azurerm_public_ip" "panoramapip" {
  count = (var.environment_acronym == "dv" || var.environment_acronym == "qa") ? 0 : 1

  name                    = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${local.panoramavm_name}-pip${var.unique_variable_suffix}" : "pip-${local.panoramavm_name}"
  resource_group_name     = azurerm_resource_group.panorama.name
  location                = azurerm_resource_group.panorama.location
  sku                     = "Standard"
  allocation_method       = "Static"
  idle_timeout_in_minutes = 4

  tags = var.tags_Networking
}

resource "azurerm_public_ip" "fw_pip_dr_1" {

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip1-firewall-${var.firewall_environment_dr}" : "pip-fwl-${var.location_dr_acronym}-primary-${var.firewall_environment_dr}-1"
  resource_group_name = azurerm_resource_group.drhubvnetrg.name
  location            = azurerm_resource_group.drhubvnetrg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
  domain_name_label   = "azfw-cc-${var.firewall_pip_environment_dr}-pip1"
  availability_zone   = "No-Zone"

  tags = var.tags_dr_Networking
}

resource "azurerm_public_ip" "fw_pip_dr_2" {

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip2-firewall-${var.firewall_environment_dr}" : "pip-fwl-${var.location_dr_acronym}-primary-${var.firewall_environment_dr}-2"
  resource_group_name = azurerm_resource_group.drhubvnetrg.name
  location            = azurerm_resource_group.drhubvnetrg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
  domain_name_label   = "azfw-cc-${var.firewall_pip_environment_dr}-pip2"
  availability_zone   = "No-Zone"

  tags = var.tags_dr_Networking
}

resource "azurerm_public_ip" "fw_pip_dr_3" {

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "pip3-firewall-${var.firewall_environment_dr}" : "pip-fwl-${var.location_dr_acronym}-primary-${var.firewall_environment_dr}-3"
  resource_group_name = azurerm_resource_group.drhubvnetrg.name
  location            = azurerm_resource_group.drhubvnetrg.location
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"
  domain_name_label   = "azfw-cc-${var.firewall_pip_environment_dr}-pip3"
  availability_zone   = "No-Zone"

  tags = var.tags_dr_Networking
}