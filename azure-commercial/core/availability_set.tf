resource "azurerm_availability_set" "cicdwinsas" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-cicdwin-as" : "avs-${var.location_acronym}-cicd-${var.environment_acronym}"
  location            = azurerm_resource_group.opscore.location
  resource_group_name = azurerm_resource_group.opscore.name
  managed             = true

  tags = var.tags_BuildAgent
}

resource "azurerm_availability_set" "bastion-as" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-bastion-as" : "avs-${var.location_acronym}-bastion-${var.environment_acronym}"
  location            = azurerm_resource_group.bstnhosts.location
  resource_group_name = azurerm_resource_group.bstnhosts.name
  managed             = true

  tags = var.tags
}

resource "azurerm_availability_set" "rdscbas" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-rdscb-as" : "avs-${var.location_acronym}-rdscb-${var.environment_acronym}"
  location            = azurerm_resource_group.rds.location
  resource_group_name = azurerm_resource_group.rds.name
  managed             = true

  platform_update_domain_count = 5
  platform_fault_domain_count  = 2

  tags = var.tags
}

resource "azurerm_availability_set" "rdsgwas" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-rdsgw-as" : "avs-${var.location_acronym}-rdsgw-${var.environment_acronym}"
  location            = azurerm_resource_group.rds.location
  resource_group_name = azurerm_resource_group.rds.name
  managed             = true

  platform_update_domain_count = 5
  platform_fault_domain_count  = 2

  tags = var.tags
}

resource "azurerm_availability_set" "mfaas" {
  count = var.environment_acronym == "dv" ? 0 : 1

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-mfa-as" : "avs-${var.location_acronym}-mfa-${var.environment_acronym}"
  location            = azurerm_resource_group.mfa.location
  resource_group_name = azurerm_resource_group.mfa.name
  managed             = true

  platform_update_domain_count = 5
  platform_fault_domain_count  = 2

  tags = var.tags
}

resource "azurerm_availability_set" "sepas" {
  count = var.environment_acronym == "dv" ? 0 : 1

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${var.legacy_env_acronym_ns}-${var.location}-sep-as" : "avs-${var.location_acronym}-sep-${var.environment_acronym}"
  location            = azurerm_resource_group.opscore.location
  resource_group_name = azurerm_resource_group.opscore.name
  managed             = true

  platform_update_domain_count = 5
  platform_fault_domain_count  = 2

  tags = var.tags
}

resource "azurerm_availability_set" "wsusas" {
  count = var.environment_acronym == "qa" ? 0 : 1

  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "CO-${upper(var.legacy_env_acronym)}-${var.location}-wsus-as" : "avs-${var.location_acronym}-wsus-${var.environment_acronym}"
  location            = azurerm_resource_group.wsus.location
  resource_group_name = azurerm_resource_group.wsus.name
  managed             = true

  platform_update_domain_count = 5
  platform_fault_domain_count  = 2

  tags = var.tags
}

module "hybwrkas" {
  source                  = "../../modules12/availability_set"
  availability_set_name   = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${upper(var.legacy_env_acronym)}-${var.location}-hybdwrk-as" : "avs-${var.location_acronym}-hybdwrk-${var.environment_acronym}"
  resource_group_location = azurerm_resource_group.loganalytics.location
  resource_group_name     = azurerm_resource_group.loganalytics.name

  tags = var.tags
}

module "hybridworkeras" {
  source                  = "../../modules12/availability_set"
  availability_set_name   = "avs-${var.location_acronym}-hybridworker-${var.environment_acronym}"
  resource_group_location = azurerm_resource_group.loganalytics.location
  resource_group_name     = azurerm_resource_group.loganalytics.name

  tags = var.tags
}

module "squidas" {
  source                  = "../../modules12/availability_set"
  availability_set_name   = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.legacy_env_acronym}-${var.location}-squid-as" : "avs-${var.location_acronym}-squid-${var.environment_acronym}"
  resource_group_location = azurerm_resource_group.hubvnet.location
  resource_group_name     = azurerm_resource_group.hubvnet.name

  tags = var.tags_Networking
}

module "powerbigatewayas" {
  source                      = "../../modules12/availability_set"
  availability_set_name       = "avs-${var.location_acronym}-pbi1-${var.environment_acronym}"
  resource_group_location     = azurerm_resource_group.hubvnet.location
  resource_group_name         = azurerm_resource_group.hubvnet.name
  platform_fault_domain_count = 2

  tags                        = var.tags_GatewayServices
}

# module "snomidas" {
#  source                  = "../../modules/availability_set"
#  availability_set_name   = "co-${upper(var.environment_acronym)}-${var.location}-snomid-as"
#  resource_group_location = azurerm_resource_group.opscore.location
#  resource_group_name     = azurerm_resource_group.opscore.name
#  tags                    = var.tags
# }

# module "build-vm-as" {
#   source                  = "../../modules12/availability_set"
#   availability_set_name   = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "co-${var.environment_acronym}-${var.location}-build-vm-as" : "avs-${var.location_acronym}-buildvm-${var.environment_acronym}"
#   resource_group_location = azurerm_resource_group.hubvnet.location
#   resource_group_name     = azurerm_resource_group.hubvnet.name

#   tags                    = var.tags

# }