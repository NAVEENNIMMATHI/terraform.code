#WVD Workstation
module "wvd_wkstn" {
  enabled = true

  source                                    = "../../modules/windows_virtual_desktop_hostpool"
  resource_group_name                       = module.applicationrg.resource_group_name
  resource_group_location                   = module.applicationrg.resource_group_location
  workspace_id                              = azurerm_virtual_desktop_workspace.workspace.id
  hostpool_name                             = "hpl-${var.location_acronym}-${var.application_acronym}-wkstn-${var.environment_acronym}"
  hostpool_description                      = "${var.tags.Solution} - hpl-${var.location_acronym}-${var.application_acronym}-wkstn-${var.environment_acronym}"
  application_group_name                    = "apg-${var.location_acronym}-${var.application_acronym}-wkstn-${var.environment_acronym}"
  application_group_description             = "${var.tags.Solution} - apg-${var.location_acronym}-${var.application_acronym}-wkstn-${var.environment_acronym}"
  application_group_assignment_principal_id = azuread_group.da_vm_wkstn_users.object_id
  log_analytics_workspace_id                = module.log-analytics-workspace.workspace_id
  custom_rdp_properties                     = "drivestoredirect:s:*;audiomode:i:0;videoplaybackmode:i:1;redirectclipboard:i:1;redirectprinters:i:1;devicestoredirect:s:*;redirectcomports:i:1;redirectsmartcards:i:1;usbdevicestoredirect:s:*;enablecredsspsupport:i:1;use multimon:i:1;"
  tags                                      = var.tags
}

#WVD Build
module "wvd_build" {
  enabled                                   = (var.environment_acronym == "dev" || var.environment_acronym == "qa") ? true : false

  source                                    = "../../modules/windows_virtual_desktop_hostpool"
  resource_group_name                       = (var.environment_acronym == "dev" || var.environment_acronym == "qa") ? module.applicationrg.resource_group_name : ""
  resource_group_location                   = (var.environment_acronym == "dev" || var.environment_acronym == "qa") ? module.applicationrg.resource_group_location : ""
  workspace_id                              = (var.environment_acronym == "dev" || var.environment_acronym == "qa") ? azurerm_virtual_desktop_workspace.workspace.id : ""
  hostpool_name                             = "hpl-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  hostpool_description                      = "${var.tags.Solution} - hpl-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  application_group_name                    = "apg-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  application_group_description             = "${var.tags.Solution} - apg-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}"
  application_group_assignment_principal_id = azuread_group.da_vm_build_users.object_id
  log_analytics_workspace_id                = module.log-analytics-workspace.workspace_id
  custom_rdp_properties                     = "drivestoredirect:s:*;audiomode:i:0;videoplaybackmode:i:1;redirectclipboard:i:1;redirectprinters:i:1;devicestoredirect:s:*;redirectcomports:i:1;redirectsmartcards:i:1;usbdevicestoredirect:s:*;enablecredsspsupport:i:1;use multimon:i:1;"

  tags                                      = var.tags
}

resource "azurerm_role_assignment" "wkstn_dag_users" {
  scope                = module.wvd_wkstn.desktop_application_group_id[0]
  role_definition_name = "Desktop Virtualization User"
  principal_id         = azuread_group.da_vm_wkstn_users.object_id
}

resource "azurerm_role_assignment" "build_dag_users" {
  count =  (var.environment_acronym == "dev" || var.environment_acronym == "qa") ? 1 : 0

  scope                = module.wvd_build.desktop_application_group_id[0]
  role_definition_name = "Desktop Virtualization User"
  principal_id         = azuread_group.da_vm_build_users.object_id
}
