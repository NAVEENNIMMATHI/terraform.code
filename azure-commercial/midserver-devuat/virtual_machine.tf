module "midserver-vm" {
  source                     = "../../modules/windowsvm"
  vm_region                  = var.location_acronym
  project_name               = var.application_acronym
  application_acronym        = var.application_acronym
  vm_workload_desc           = ""
  vm_environment             = upper(var.environment_acronym)
  resource_group_name         = module.midserver-rg.resource_group_name
  resource_group_location     = module.midserver-rg.resource_group_location
  tags                       = var.tags
  subnet_id                  = module.midserver-subnet.subnet_id
  count_value                = var.vm_count  /* if this value is zero VM will not create */
  vm_size                    = var.vm_size
  availability_set_id        = module.midserver-as.availability_set_id
  azurerm_image_id           = ""
  storage_uri                = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size             = [50,60] /* if you keep this array blank no extra disk will get created */
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = data.template_file.xml.rendered
  loganalytics_workspace_id  = module.log-analytics-workspace.workspace_id
  loganalytics_workspace_key = module.log-analytics-workspace.primary_shared_key
  storage_account_name       = module.vmdiagnosticslogssa.storage_account_name
  storage_account_key        = module.vmdiagnosticslogssa.primary_access_key
  client_id                  = data.azuread_service_principal.encryptappsp.application_id
  diskencryption_keyvault    = data.azurerm_key_vault.encryptapp_key_vault.id
  custom_emails              = "go-fmmanagedservices@kpmg.com"
  domain_name                = var.domain_name
  ou_path                    = var.ou_path
  admin_password             = var.admin_password
  encryptappsp_key_password  = var.client_secret

  #Add a OS disk block for different managed_disk_type other than Standard_LRS
  os_disk_override = {
    #create_option = "FromImage"
    storage_account_type = "StandardSSD_LRS"
    os_disk_size = "256"
  }

  #user_assigned_identity = {
  #   type = "SystemAssigned, UserAssigned"
  #   identity_ids = [azurerm_user_assigned_identity.keyvaultreader.id]
  #}

}
