module "agwnsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-agw1-${var.environment_acronym}"
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}

module "wstnsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-wst1-${var.environment_acronym}"
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}
module "pbinsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-pbi1-${var.environment_acronym}"
 resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}

module "appnsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-app1-${var.environment_acronym}"
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}

module "dbnsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-db1-${var.environment_acronym}"
 resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}
module "pepnsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-pep1-${var.environment_acronym}"
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}
module "ssisnsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-ssis1-${var.environment_acronym}"
   resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}

module "vnetintnsg" {
  for_each = var.network_security_group
  source              = "../../modules/network_security_group"
  name                = "nsg-${each.value.location_acronym}-${var.application_acronym}-${each.value.region}-vnetint-${var.environment_acronym}"
  resource_group_name        = module.applicationrg[each.key].resource_group_name
  location                   = module.applicationrg[each.key].resource_group_location

  tags                = var.tags
}