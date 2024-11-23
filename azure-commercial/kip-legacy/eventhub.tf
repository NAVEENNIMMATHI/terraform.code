module "eventhubnamespace" {
  source                   = "../../modules12/event_hub"
  event_hub_namespace_name = var.event_hub_namespace_name
  resource_group_location  = module.loganalyticsrg.resource_group_location
  resource_group_name      = module.loganalyticsrg.resource_group_name
  tags                     = var.tags
}

