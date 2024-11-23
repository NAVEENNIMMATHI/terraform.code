#WVD Workstation
module "wvd_wkstn" {
  enabled = true

  source                                    = "../../modules12/windows_virtual_desktop_hostpool"
  resource_group_name                       = module.auditpbirg.resource_group_name
  resource_group_location                   = module.auditpbirg.resource_group_location
  workspace_id                              = azurerm_virtual_desktop_workspace.workspace.id
  hostpool_name                             = "hpl-${var.location_acronym}-audit-wst-${var.environment_acronym}"
  hostpool_description                      = "${var.tags.Solution} - hpl-${var.location_acronym}-audit-wst-${var.environment_acronym}"
  application_group_name                    = "apg-${var.location_acronym}-audit-wst-${var.environment_acronym}"
  application_group_description             = "${var.tags.Solution} - apg-${var.location_acronym}-audit-wst-${var.environment_acronym}"
  application_group_assignment_principal_id = azuread_group.audit_powerbi_vm_wkstn_users.object_id
  log_analytics_workspace_id                = data.azurerm_log_analytics_workspace.loganalyticsworkspace.id
  tags                                      = var.tags
}

resource "azurerm_role_assignment" "wkstn_dag_users" {
  scope                = module.wvd_wkstn.desktop_application_group_id[0]
  role_definition_name = "Desktop Virtualization User"
  principal_id         = azuread_group.audit_powerbi_vm_wkstn_users.object_id
}