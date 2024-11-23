module "buildvm_dotnet4_5" {
  source                     = "../../modules/windowsvm"
  vm_region                  = "EUS"
  project_name               = "DA"
  application_acronym        = "DA"
  vm_workload_desc           = "NF5"
  vm_environment             = upper(var.environment_acronym)
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  tags                       = merge(var.buildvmtag,var.tags)
  subnet_id                  = module.buildsubnet.subnet_id
  count_value                = var.vm_count_buildvm_dotnet4_5  /* if this value is zero VM will not create */
  data_disk_count            = 0
  vm_size                    = var.vm_size_build
  availability_set_id        = module.aset_build.availability_set_id
  azurerm_image_id           = ""
  storage_uri                = module.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size             = [] /* if you keep this array blank no extra disk will get created */
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = data.template_file.xml.rendered
  loganalytics_workspace_id  = module.log-analytics-workspace.workspace_id
  loganalytics_workspace_key = module.log-analytics-workspace.primary_shared_key
  storage_account_name       = module.vmdiagnosticslogs.storage_account_name
  storage_account_key        = module.vmdiagnosticslogs.primary_access_key
  client_id                  = data.azuread_service_principal.encryptApp.application_id
  diskencryption_keyvault    = module.keyvault.key_vault_id
  backup_resource_group_name = module.backuprecoveryrg.resource_group_name
  recovery_vault_name        = module.recoveryservice.services_vault_name
  backup_policy_id           = module.recoveryservice.backup_policy_id
  custom_emails              = "go-fmmanagedservices@kpmg.com"
  domain_name                = var.domain_name
  ou_path                    = var.ou_path
  domain_user_name           = var.domain_user_name
  domain_user_password       = var.domain_user_password
  admin_password             = var.admin_password
  encryptappsp_key_password  = var.client_secret

  #Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override = {
    storage_account_type = "StandardSSD_LRS"
    os_disk_size        = "450"
  }

}


module "buildvm_kme" {
  source                     = "../../modules/windowsvm"
  vm_region                  = "EUS"
  project_name               = "DA"
  application_acronym        = "DA"
  vm_workload_desc           = "BLD"
  vm_environment             = upper(var.environment_acronym)
  resource_group_name         = module.applicationrg.resource_group_name
  resource_group_location     = module.applicationrg.resource_group_location
  tags                       = merge(var.buildvmtag,var.tags)
  subnet_id                  = module.buildsubnet.subnet_id
  count_value                = var.vm_count_buildvm_kme  /* if this value is zero VM will not create */
  data_disk_count            = 2
  vm_size                    = var.vm_size_build
  availability_set_id        = module.aset_build.availability_set_id
  azurerm_image_id           = ""
  storage_uri                = module.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size             = [200,200] /* if you keep this array blank no extra disk will get created */
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = data.template_file.xml.rendered
  loganalytics_workspace_id  = module.log-analytics-workspace.workspace_id
  loganalytics_workspace_key = module.log-analytics-workspace.primary_shared_key
  storage_account_name       = module.vmdiagnosticslogs.storage_account_name
  storage_account_key        = module.vmdiagnosticslogs.primary_access_key
  client_id                  = data.azuread_service_principal.encryptApp.application_id
  diskencryption_keyvault    = module.keyvault.key_vault_id
  backup_resource_group_name = module.backuprecoveryrg.resource_group_name
  recovery_vault_name        = module.recoveryservice.services_vault_name
  backup_policy_id           = module.recoveryservice.backup_policy_id
  custom_emails              = "go-fmmanagedservices@kpmg.com"
  domain_name                = var.domain_name
  ou_path                    = var.ou_path
  domain_user_name           = var.domain_user_name
  domain_user_password       = var.domain_user_password
  admin_password             = var.admin_password
  encryptappsp_key_password  = var.client_secret

  #Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override = {
    storage_account_type = "StandardSSD_LRS"
    os_disk_size        = "450"
  }

}
