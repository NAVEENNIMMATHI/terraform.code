module "storage_account" {
  source                     = "../../modules/storage_account"
  storage_account_name       = "sto${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_location    = azurerm_resource_group.datadogrg.location
  resource_group_name        = azurerm_resource_group.datadogrg.name
  account_kind               = "StorageV2"
  account_replication_type   = "LRS"
  virtual_network_subnet_ids = [data.azurerm_subnet.build.id, data.azurerm_subnet.app.id, var.ase_subnet_id, var.core_aks_subnet_id]

  tags = var.tags
}

resource "azurerm_role_assignment" "spn_devops" {
  scope                = module.storage_account.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}