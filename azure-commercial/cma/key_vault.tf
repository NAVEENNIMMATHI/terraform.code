resource "azurerm_key_vault" "key_vault" {
  name                = var.environment=="development" ? "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}1" : "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.cmarg.resource_group_name
  location            = module.cmarg.resource_group_location
  tags                = var.tags
  sku_name            = "standard"
  
  tenant_id = data.azurerm_client_config.current.tenant_id

  enabled_for_deployment          = "true"
  
  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.terraform_remote_state.shared.outputs.ase_subnet_id]
  }
}