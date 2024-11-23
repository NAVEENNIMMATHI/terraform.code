module "eventhubnamespace" {
  source                   = "../../modules12/event_hub"
  event_hub_namespace_name = var.environment == "production" ? "co-p-eastus-clo1-eventhub" : "ehb-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_location  = module.loganalyticsrg.resource_group_location
  resource_group_name      = module.loganalyticsrg.resource_group_name

  tags                     = var.tags
}