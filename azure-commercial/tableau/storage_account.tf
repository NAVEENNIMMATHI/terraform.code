## Storage Accounts Related to Logging

locals {
  common_prefix_sto           = "sto${var.location_acronym}${var.application_acronym}"
}

# Storage Account Number 1
module "copeastustableaurg825" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment=="production" ? "copeastustableaurg825" : "${local.common_prefix_sto}log825${var.environment_acronym}"
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  enable_https_traffic_only   = false
  network_rule_default_action = "Allow"

  tags                        = var.tags
}

# Storage Account Number 2
module "copeastustableaurg833" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment=="production" ? "copeastustableaurg833" : "${local.common_prefix_sto}log833${var.environment_acronym}"
  resource_group_name         = upper(module.applicationrg.resource_group_name)
  resource_group_location     = module.applicationrg.resource_group_location
  enable_https_traffic_only   = false
  network_rule_default_action = "Allow"

  tags                        = var.tags
}

# Storage Account Number 3
module "cospitableaufiles" {
  source                      = "../../modules/storage_account"
  storage_account_name        = var.environment=="production" ? "cospitableaufiles" : "${local.common_prefix_sto}files${var.environment_acronym}"  
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  enable_https_traffic_only   = true
  network_rule_default_action = "Allow"

  tags                        = var.tags
}