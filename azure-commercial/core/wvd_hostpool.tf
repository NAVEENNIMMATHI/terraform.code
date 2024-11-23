
 module "wvd_core" {
  enabled = (var.environment_acronym == "dv" || var.environment_acronym == "pd")  ? true : false

  source                                    = "../../modules/windows_virtual_desktop_hostpool"
  resource_group_name                       = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.wvd[0].name : ""
  resource_group_location                   = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_resource_group.wvd[0].location : ""
  workspace_id                              = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? azurerm_virtual_desktop_workspace.workspace[0].id : ""
  hostpool_name                             = "hpl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  hostpool_description                      = "${var.tags.Solution} - hpl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  application_group_name                    = "apg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  application_group_description             = "${var.tags.Solution} - apg-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  application_group_assignment_principal_id = data.azuread_group.wvd_remote_group.id
  log_analytics_workspace_id                = azurerm_log_analytics_workspace.hub.id
  tags                                      = var.tags
}