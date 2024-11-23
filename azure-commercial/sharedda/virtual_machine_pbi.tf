module "pbigwvm" {
  source                     = "../../modules/virtual_machine_universal_win2016"
  vm_region                  = "EUS"
  project_name               = "DA"
  application_acronym        = "DA"
  vm_workload_desc           = "PBI"
  vm_environment             = upper(var.environment_acronym)
  resource_group_name        = module.applicationrg.resource_group_name
  resource_group_location    = module.applicationrg.resource_group_location
  tags                       = var.tags
  subnet_id                  = module.pbisubnet.subnet_id
  count_value                = var.vm_count_pbi
  vm_size                    = var.vm_size_pbi
  availability_set_id        = module.aset_pbi.availability_set_id
  azurerm_image_id           = ""
  storage_uri                = module.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size             = "250"
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
    create_option = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }

#Add as many data disk blocks required for the Virtual machine (Supports upto 5). Only the added blocks for data disks will be created
#for DA Project only 2 data disks are required, hence 2 blocks of data disks.
  data_disk_1_override = {
      create_option = "Empty"
      managed_disk_type = "Standard_LRS"
      disk_size_gb = 200
  }
  data_disk_2_override = {
      create_option = "Empty"
      managed_disk_type = "Standard_LRS"
      disk_size_gb = 200
  }
}