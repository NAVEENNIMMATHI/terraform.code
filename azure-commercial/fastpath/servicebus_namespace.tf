module "servicebusnamespace" {
  source                    = "../../modules/servicebus_namespace"
  servicebus_namespace_name = "sbn-${var.location_acronym}-${var.application_name}-${var.environment_acronym}"
  resource_group_name       = module.apprg.resource_group_name
  resource_group_location   = module.apprg.resource_group_location
  servicebus_namespace_sku  = "standard"
  tags                      = var.tags
}

