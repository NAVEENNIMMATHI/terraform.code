module "tableau_server_as" {
  source                      = "../../modules/availability_set"
  availability_set_name       = var.environment == "production" ? "UEMCSPISRVR3P1" : "avs-${var.location_acronym}-${var.application_acronym_spi}-tableauserver-${var.environment_acronym}"
  resource_group_location     = module.applicationrg.resource_group_location
  resource_group_name         = module.applicationrg.resource_group_name
  platform_fault_domain_count = "2"
  tags                        = var.tags
}