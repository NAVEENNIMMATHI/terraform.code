locals {
  common_prefix_nsg       = "nsg-${var.location_acronym}-${var.application_acronym}"
}
module "agw1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-pd-eastus-kipagw1-nsg" :  "${local.common_prefix_nsg}-agw1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "wst1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-pd-eastus-kipwst1-nsg" :  "${local.common_prefix_nsg}-wst1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "app1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-pd-eastus-kipapp1-nsg" :  "${local.common_prefix_nsg}-app1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "ase1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-pd-eastus-kipase1-nsg" :  "${local.common_prefix_nsg}-ase1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "pbi1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-pd-eastus-kippbi1-nsg" :  "${local.common_prefix_nsg}-pbi1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "db1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-pd-eastus-kipdb1-nsg" :  "${local.common_prefix_nsg}-db1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "adx1nsg" {
  source              = "../../modules/network_security_group"
  name                = var.environment == "production" ? "co-pd-eastus-kipadx1-nsg" :  "${local.common_prefix_nsg}-adx1-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "kpimcapiqnsg" {
  source              = "../../modules/network_security_group"
  name                = "${local.common_prefix_nsg}-kpimcapiq-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

module "databricksprivatensg" {
  source              = "../../modules/network_security_group"
  name                = "${local.common_prefix_nsg}-databricksprivate-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}
module "databrickspublicnsg" {
  source              = "../../modules/network_security_group"
  name                = "${local.common_prefix_nsg}-databrickspublic-${var.environment_acronym}"
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name

  tags                = var.tags
}

