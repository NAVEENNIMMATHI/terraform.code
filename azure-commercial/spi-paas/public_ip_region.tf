resource "azurerm_public_ip" "ssis_pip1" {
  for_each                    = var.public_ip
  name                        = "pip-ssis-${each.value.location_acronym}-${var.application_acronym}1-${each.value.region}-${var.environment_acronym}"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  location                    = module.applicationrg[each.key].resource_group_location
  allocation_method           = "Static"
  sku                         = "Standard"
  domain_name_label           = "pip-ssis-${each.value.location_acronym}-${var.application_acronym}1-${each.value.region}-${var.environment_acronym}"
  tags                        = var.tags
}
resource "azurerm_public_ip" "ssis_pip2" {
  for_each                    = var.public_ip
  name                        = "pip-ssis-${each.value.location_acronym}-${var.application_acronym}2-${each.value.region}-${var.environment_acronym}"
  resource_group_name         = module.applicationrg[each.key].resource_group_name
  location                    = module.applicationrg[each.key].resource_group_location
  allocation_method           = "Static"
  sku                         = "Standard"
  domain_name_label           = "pip-ssis-${each.value.location_acronym}-${var.application_acronym}2-${each.value.region}-${var.environment_acronym}"
  tags                        = var.tags
}