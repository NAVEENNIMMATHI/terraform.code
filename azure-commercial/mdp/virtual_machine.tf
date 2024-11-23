module "buildvm_iics" {
  source                     = "../../modules/windowsvm"
  vm_region                  = "WUS"
  project_name               = "MDP"
  application_acronym        = ""
  vm_workload_desc           = "IICS"
  vm_environment             = var.environment_acronym == "uat" ? "UT" : upper(var.environment_acronym)

  resource_group_name         = module.mdp_rg_main.resource_group_name
  resource_group_location     = module.mdp_rg_main.resource_group_location

  tags                       = var.tags
  subnet_id                  = module.iicssubnet.subnet_id

  count_value                = var.vm_count_buildvm_iics  /* if this value is zero VM will not create */
  data_disk_count            = 2
  vm_size                    = var.vm_size_build

  availability_set_id        = module.aset_iics.availability_set_id
  azurerm_image_id           = ""
  storage_uri                = module.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size             = [200,200] /* if you keep this array blank no extra disk will get created */
  data_disk_storage_account_type = "Premium_LRS"
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = ""

  loganalytics_workspace_id  = ""
  loganalytics_workspace_key = ""

  storage_account_name       = module.vmdiagnosticslogs.storage_account_name
  storage_account_key        = module.vmdiagnosticslogs.primary_access_key
  client_id                  = ""
  diskencryption_keyvault    = ""
  backup_resource_group_name = ""
  recovery_vault_name        = ""
  backup_policy_id           = ""
  custom_emails              = "go-fmmanagedservices@kpmg.com"




  admin_password             = var.vm_admin_password


  #Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override = {
    storage_account_type = "Premium_LRS"
    os_disk_size        = var.os_disk_size
  }

  user_assigned_identity       = {
    type = "SystemAssigned"
    identity_ids = []
  }

}

#Test Vm Creation
module "buildvm_iics_test" {
  source                     = "../../modules/windowsvm"
  vm_region                  = "WUS"
  project_name               = "MDP"
  application_acronym        = ""
  vm_workload_desc           = "TS"
  vm_environment             = "${upper(var.environment_acronym)}"
  resource_group_name        = module.mdp_rg_main.resource_group_name
  resource_group_location    = module.mdp_rg_main.resource_group_location
  tags                       = var.tags
  subnet_id                  = module.iicssubnet.subnet_id
  count_value                = var.vm_count_buildvm_iics_ts  /* if this value is zero VM will not create */
  data_disk_count            = 2
  vm_size                    = var.vm_size_build
  availability_set_id        = module.aset_iics.availability_set_id
  azurerm_image_id           = ""
  storage_uri                = module.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size             = [200,200] /* if you keep this array blank no extra disk will get created */
  data_disk_storage_account_type = "Premium_LRS"
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = ""
  loganalytics_workspace_id  = ""
  loganalytics_workspace_key = ""
  storage_account_name       = module.vmdiagnosticslogs.storage_account_name
  storage_account_key        = module.vmdiagnosticslogs.primary_access_key
  client_id                  = ""
  diskencryption_keyvault    = ""
  backup_resource_group_name = ""
  recovery_vault_name        = ""
  backup_policy_id           = ""
  custom_emails              = "go-fmmanagedservices@kpmg.com"
  admin_password             = var.vm_admin_password
  
  #Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override = {
    storage_account_type = "Premium_LRS"
    os_disk_size        = "127"
  }
  user_assigned_identity       = {
    type = "SystemAssigned"
    identity_ids = []
  }
}

#module "mdp_vm_avscan" {
#  source                     = "../../modules/windowsvm"
#  vm_region                  = "WUS"
#  project_name               = "MDP"
#  application_acronym        = ""
#  vm_workload_desc           = "AV"
#  vm_environment             = upper(var.environment_acronym)
#
#  resource_group_name         = module.mdp_rg_main.resource_group_name
#  resource_group_location     = module.mdp_rg_main.resource_group_location
#
#  tags                       = var.tags
#  subnet_id                  = module.mdp_subnet_avscan.subnet_id
#
#  count_value                = 1  /* if this value is zero VM will not create */
#  data_disk_count            = 2
#  vm_size                    = var.vm_size_build
#
#  availability_set_id        = module.aset_avscan.availability_set_id
#  azurerm_image_id           = ""
#  storage_uri                = module.vmdiagnosticslogs.primary_blob_endpoint
#  data_disk_size             = [200,200] /* if you keep this array blank no extra disk will get created */
#  data_disk_storage_account_type = "Premium_LRS"
#  template_file              = data.template_file.ps1.rendered
#  template_file_xml          = ""
#
#  loganalytics_workspace_id  = ""
#  loganalytics_workspace_key = ""
#
#  storage_account_name       = module.vmdiagnosticslogs.storage_account_name
#  storage_account_key        = module.vmdiagnosticslogs.primary_access_key
#  client_id                  = ""
#  diskencryption_keyvault    = ""
#  backup_resource_group_name = ""
#  recovery_vault_name        = ""
#  backup_policy_id           = ""
#  custom_emails              = "go-fmmanagedservices@kpmg.com"
#
#  admin_password             = var.vm_admin_password
#
#  #Add a OS disk block for different managed_disk_type other than Standard_LRS
#  os_disk_override = {
#    storage_account_type = "Premium_LRS"
#    os_disk_size        = "127"
#  }
#
#  user_assigned_identity       = {
#    type = "SystemAssigned"
#    identity_ids = []
#  }
#
#}
