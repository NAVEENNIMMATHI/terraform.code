module "loganalytics" {
  source                       = "../../modules12/log_analytics"
  log_analytics_workspace_name = "law-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = azurerm_resource_group.ofr.name
  resource_group_location      = azurerm_resource_group.ofr.location
  
  tags                         = var.tags
}