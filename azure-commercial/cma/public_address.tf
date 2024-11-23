resource "azurerm_public_ip" "public_ip" {
  name                  = "pip-agw-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name   = module.cmarg.resource_group_name
	location              = module.cmarg.resource_group_location
  allocation_method     = "Dynamic"
  tags                  = var.tags
}