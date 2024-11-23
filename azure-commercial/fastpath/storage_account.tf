module "appsa" {
  source                             = "../../modules/storage_account"
  storage_account_name               = "sto${var.location_acronym}${var.application_name}app${var.environment_acronym}"
  resource_group_location            = module.apprg.resource_group_location
  resource_group_name                = module.apprg.resource_group_name
  tags                               = var.tags
  account_replication_type           = "RAGRS"
  virtual_network_subnet_ids         = [module.appsubnet.subnet_id, data.azurerm_subnet.asesubnet.id, data.azurerm_subnet.appgatewaysubnet.id]
  network_rule_default_action        = "Allow"
  kpmg_nat_ip_list                   = ["168.62.48.129"]
  delete_retention_policy_days       = 1
}

resource "azurerm_advanced_threat_protection" "advanced_threat_protection" {
  target_resource_id = module.appsa.id
  enabled            = true
}