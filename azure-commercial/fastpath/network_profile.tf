module "acinwprofile" {
  source                           = "../../modules/network_profile"
  name                             = "npr-${var.location_acronym}-${var.application_name}-aci-${var.environment_acronym}"
  location                         = module.apprg.resource_group_location
  resource_group_name              = module.apprg.resource_group_name
  tags                             = var.tags
  container_network_interface_name = "fastpathcnic"
  ipconfig_name                    = "fastpathaciipconfig"
  subnet_id                        = azurerm_subnet.acisubnet.id
}

