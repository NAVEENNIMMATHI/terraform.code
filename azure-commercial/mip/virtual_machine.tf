# Build License Manager machine
module "buildvm_license_manager" {
  source              = "../../modules/windowsvm"
  vm_region           = "EUS"
  project_name        = "MIP"
  application_acronym = ""
  vm_workload_desc    = upper(var.license_manager_acronym)
  vm_environment      = upper(var.environment_acronym)

  resource_group_name     = module.mathworks_rg_shared.resource_group_name
  resource_group_location = module.mathworks_rg_shared.resource_group_location

  tags      = var.tags
  subnet_id = module.subnet_license_manager.subnet_id

  count_value     = var.vm_count_buildvm_license_manager /* if this value is zero VM will not create */
  data_disk_count = 2
  vm_size         = var.vm_size_build

  availability_set_id            = module.aset_license_manager.availability_set_id
  azurerm_image_id               = ""
  storage_uri                    = module.vmdiagnosticslogs.primary_blob_endpoint
  data_disk_size                 = [200, 200] /* if you keep this array blank no extra disk will get created */
  data_disk_storage_account_type = "Premium_LRS"
  template_file                  = data.template_file.ps1.rendered
  template_file_xml              = ""

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

  domain_name                  = "kconp.local"
  ou_path                      = "OU=AADDC Computers,DC=kconp,DC=local"
  domain_user_name             = ""
  domain_user_password         = ""

  admin_password = var.mathworks_vm_admin_password

  #Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override = {
    storage_account_type = "Premium_LRS"
    os_disk_size         = "127"
  }

  user_assigned_identity = {
    type         = "SystemAssigned"
    identity_ids = []
  }
}