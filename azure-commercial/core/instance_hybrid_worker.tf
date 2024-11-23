module "hybwrk1vm" {
  source                       = "../../modules12/virtual_machine_universal_win2016"
  project_name                 = "WRK"
  application_acronym          = "HYB"
  vm_environment               = upper(var.legacy_env_acronym)
  resource_group_location      = azurerm_resource_group.loganalytics.location
  resource_group_name          = azurerm_resource_group.loganalytics.name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.infra1.id
  count_value                  = var.hyb_worker_vm_count
  vm_size                      = "Standard_DS3_v2"
  need_zones                   = var.need_zones
  availability_set_id          = module.hybwrkas.availability_set_id
  enforce_vm_naming_convention = false
  azurerm_image_id             = ""
  storage_uri                  = azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size               = "500"
  template_file                = data.template_file.ps1.rendered
  template_file_xml            = data.template_file.xml.rendered
  loganalytics_workspace_id    = azurerm_log_analytics_workspace.hub.workspace_id
  loganalytics_workspace_key   = azurerm_log_analytics_workspace.hub.primary_shared_key
  storage_account_name         = azurerm_storage_account.vmdiagnosticslogs.name
  storage_account_key          = azurerm_storage_account.vmdiagnosticslogs.primary_access_key
  client_id                    = ""
  diskencryption_keyvault      = azurerm_key_vault.hub.id
  backup_resource_group_name   = azurerm_resource_group.backuprecovery.name
  recovery_vault_name          = azurerm_recovery_services_vault.hub.name
  custom_emails                = var.custom_emails
  domain_name                  = var.domain_name
  ou_path                      = var.ou_path
  domain_user_name             = var.domain_user_name
  domain_user_password         = var.domain_user_password
  admin_password               = var.common_virtual_machine_password
  encryptappsp_key_password    = var.encryptappsp_key_password #tfsec:ignore:GEN003

  # To enable and link User Assigned Identity to the VM
  user_assigned_identity = {
    type         = "SystemAssigned, UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.keyvaultreader.id]
  }

}

# Adding contributor role to np-spoke-application subscription in non-prod and pd-spoke-application in prod. 
resource "azurerm_role_assignment" "contributor" {
  scope                = data.azurerm_subscription.spokeapp.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.keyvaultreader.principal_id
}
