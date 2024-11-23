resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnets
  name                                           = "sub-${var.location_acronym}-${var.application_acronym}-${each.key}-${var.environment_acronym}"
  virtual_network_name                           = data.terraform_remote_state.shared.outputs.shared_vnet_name
  resource_group_name                            = data.terraform_remote_state.shared.outputs.shared_rg_name
  address_prefixes                               = [each.value.address_space]
  enforce_private_link_endpoint_network_policies = true
  service_endpoints                              = ["Microsoft.KeyVault"]
}