module "auditwstvm" {
  source                     = "../../modules12/windowsvm"
  vm_region                  = "USE"
  project_name               = "AUD"
  application_acronym        = "AUD"
  vm_workload_desc           = "WST"  
  vm_environment             = upper(var.environment_acronym)
  resource_group_name        = module.auditpbirg.resource_group_name
  resource_group_location    = module.auditpbirg.resource_group_location
  tags                       = var.tags
  subnet_id                  = module.auditwstsubnet.subnet_id
  count_value                = var.vm_count_auditwst
  data_disk_count            = 1
  vm_size                    = var.vm_size_auditwst
  availability_set_id        = module.aset_auditwst.availability_set_id
  azurerm_image_id           = ""
  storage_uri                = data.azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size             = ["512"]
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = data.template_file.xml.rendered
  loganalytics_workspace_id  = data.azurerm_log_analytics_workspace.loganalyticsworkspace.id
  loganalytics_workspace_key = data.azurerm_log_analytics_workspace.loganalyticsworkspace.primary_shared_key
  storage_account_name       = data.azurerm_storage_account.vmdiagnosticslogs.name
  storage_account_key        = data.azurerm_storage_account.vmdiagnosticslogs.primary_access_key
  client_id                  = data.azuread_service_principal.encryptApp.application_id
  diskencryption_keyvault    = data.azurerm_key_vault.keyvault.id
  backup_resource_group_name = ""
  recovery_vault_name        = ""
  backup_policy_id           = ""
  custom_emails              = "go-fmmanagedservices@kpmg.com"
  domain_name                = var.domain_name
  ou_path                    = var.ou_path
  domain_user_name           = var.domain_user_name
  domain_user_password       = var.domain_user_password
  admin_password             = var.admin_password
  encryptappsp_key_password  = var.client_secret

  enable_automatic_updates = false
  patch_mode   = "Manual"

#Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override = {
    storage_account_type = "StandardSSD_LRS"
    os_disk_size         = "450"
  }

}