module "bmpapp1vm" {
  source                       = "../../modules/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = var.environment == "production" ? "APP" : "BMP"
  vm_environment               = var.environment == "production" ? "P" : upper(var.environment_acronym2)
  vm_region                    = "USE"
  vm_workload_desc             = "APP"
  resource_group_location      = module.applicationrg.resource_group_location
  resource_group_name          = module.applicationrg.resource_group_name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.bmpapp1subnet.id
  count_value                  = var.count_value_bmpappvm_module
  vm_size                      = var.vmsize_app
  availability_set_id          = module.bmpapp1as.availability_set_id
  storage_uri                  = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size               = "200"
  template_file                = data.template_file.ps1.rendered
  template_file_xml            = data.template_file.xml.rendered
  loganalytics_workspace_id    = data.azurerm_log_analytics_workspace.cospi.workspace_id
  loganalytics_workspace_key   = data.azurerm_log_analytics_workspace.cospi.primary_shared_key
  storage_account_name         = module.vmdiagnosticslogssa.storage_account_name
  storage_account_key          = module.vmdiagnosticslogssa.primary_access_key
  client_id                    = ""
  diskencryption_keyvault      = module.keyvault.key_vault_id
  backup_resource_group_name   = module.backuprecoveryrg.resource_group_name
  recovery_vault_name          = module.recoveryservice.services_vault_name
  backup_policy_id             = module.recoveryservice.backup_policy_id
  custom_emails                = var.custom_emails
  domain_name                  = var.domain_name
  ou_path                      = var.ou_path
  domain_user_name             = var.domain_user_name
  domain_user_password         = var.domain_user_password
  admin_username               = ""
  admin_password               = var.admin_password
  encryptappsp_key_password    = var.encryptappsp_key_password
  enforce_vm_naming_convention = var.environment == "production" ? false : true
  azurerm_image_id             = var.environment == "production" ? var.azurerm_image_id : ""
  publisher                    = var.environment == "production" ? "" : "MicrosoftWindowsServer"
  offer                        = var.environment == "production" ? "" : "WindowsServer"
  sku                          = var.environment == "production" ? "" : "2016-Datacenter"
  vmimageversion               = var.environment == "production" ? "" : "latest"
  vm_name_suffix               = "1"
  storage_data_disk_1          = "UEMCBMPAPP1P1_DataDisk_1"
  storage_data_disk_2          = "UEMCBMPAPP1P1_DataDisk_2"

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

module "bmprest1vm" {
  source                       = "../../modules12/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = var.environment == "production" ? "REST" : "BMP"
  vm_environment               = var.environment == "production" ? "P" : upper(var.environment_acronym2)
  vm_region                    = "USE"
  vm_workload_desc             = "REST"
  resource_group_location      = module.applicationrg.resource_group_location
  resource_group_name          = module.applicationrg.resource_group_name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.bmprest1subnet.id
  count_value                  = var.count_value_bmprestvm_module
  vm_size                      = var.vmsize_rest
  availability_set_id          = module.bmprest1as.availability_set_id
  storage_uri                  = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size               = "200"
  template_file                = data.template_file.ps1.rendered
  template_file_xml            = data.template_file.xml.rendered
  loganalytics_workspace_id    = data.azurerm_log_analytics_workspace.cospi.workspace_id
  loganalytics_workspace_key   = data.azurerm_log_analytics_workspace.cospi.primary_shared_key
  storage_account_name         = module.vmdiagnosticslogssa.storage_account_name
  storage_account_key          = module.vmdiagnosticslogssa.primary_access_key
  client_id                    = ""
  diskencryption_keyvault      = module.keyvault.key_vault_id
  backup_resource_group_name   = module.backuprecoveryrg.resource_group_name
  recovery_vault_name          = module.recoveryservice.services_vault_name
  backup_policy_id             = module.recoveryservice.backup_policy_id
  custom_emails                = var.custom_emails
  domain_name                  = var.domain_name
  ou_path                      = var.ou_path
  domain_user_name             = var.domain_user_name
  domain_user_password         = var.domain_user_password
  admin_username               = ""
  admin_password               = var.admin_password
  encryptappsp_key_password    = var.encryptappsp_key_password
  enforce_vm_naming_convention = var.environment == "production" ? false : true
  azurerm_image_id             = var.environment == "production" ? var.azurerm_image_id : ""
  publisher                    = var.environment == "production" ? "" : "MicrosoftWindowsServer"
  offer                        = var.environment == "production" ? "" : "WindowsServer"
  sku                          = var.environment == "production" ? "" : "2016-Datacenter"
  vmimageversion               = var.environment == "production" ? "" : "latest"
  vm_name_suffix               = "1"
  storage_data_disk_1          = "UEMCBMPREST1P1_DataDisk_1"
  storage_data_disk_2          = "UEMCBMPREST1P1_DataDisk_2"


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

module "bmpkpim1vm" {
  source                       = "../../modules12/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = var.environment == "production" ? "KPIM" : "BMP"
  vm_environment               = var.environment == "production" ? "P" : upper(var.environment_acronym2)
  vm_region                    = "USE"
  vm_workload_desc             = "KPIM"
  resource_group_location      = module.applicationrg.resource_group_location
  resource_group_name          = module.applicationrg.resource_group_name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.kpimcapiqsubnet.id
  count_value                  = var.count_value_bmpkpimvm_module
  vm_size                      = var.vmsize_kpi
  availability_set_id          = module.bmpkpim1as.availability_set_id
  storage_uri                  = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size               = "200"
  template_file                = data.template_file.ps1.rendered
  template_file_xml            = data.template_file.xml.rendered
  loganalytics_workspace_id    = data.azurerm_log_analytics_workspace.cospi.workspace_id
  loganalytics_workspace_key   = data.azurerm_log_analytics_workspace.cospi.primary_shared_key
  storage_account_name         = module.vmdiagnosticslogssa.storage_account_name
  storage_account_key          = module.vmdiagnosticslogssa.primary_access_key
  client_id                    = ""
  diskencryption_keyvault      = module.keyvault.key_vault_id
  backup_resource_group_name   = module.backuprecoveryrg.resource_group_name
  recovery_vault_name          = module.recoveryservice.services_vault_name
  backup_policy_id             = module.recoveryservice.backup_policy_id
  custom_emails                = var.custom_emails
  domain_name                  = var.domain_name
  ou_path                      = var.ou_path
  domain_user_name             = var.domain_user_name
  domain_user_password         = var.domain_user_password
  admin_username               = ""
  admin_password               = var.admin_password
  encryptappsp_key_password    = var.encryptappsp_key_password
  enforce_vm_naming_convention = var.environment == "production" ? false : true
  azurerm_image_id             = var.environment == "production" ? var.azurerm_image_id : ""
  publisher                    = var.environment == "production" ? "" : "MicrosoftWindowsServer"
  offer                        = var.environment == "production" ? "" : "WindowsServer"
  sku                          = var.environment == "production" ? "" : "2016-Datacenter"
  vmimageversion               = var.environment == "production" ? "" : "latest"
  vm_name_suffix               = "1"
  storage_data_disk_1          = "UEMCBMPKPIM1P1_DataDisk_1"
  storage_data_disk_2          = "UEMCBMPKPIM1P1_DataDisk_2"

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

module "bmpinfo1vm" {
  source                       = "../../modules12/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = var.environment == "production" ? "INFO" : "BMP"
  vm_environment               = var.environment == "production" ? "P" : upper(var.environment_acronym2)
  vm_region                    = "USE"
  vm_workload_desc             = "INFO"
  resource_group_location      = module.applicationrg.resource_group_location
  resource_group_name          = module.applicationrg.resource_group_name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.bmpinformaticasubnet.id
  count_value                  = var.count_value_bmpinfovm_module
  vm_size                      = var.vmsize_info
  availability_set_id          = module.bmpinfo1as.availability_set_id
  storage_uri                  = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size               = "200"
  template_file                = data.template_file.ps1.rendered
  template_file_xml            = data.template_file.xml.rendered
  loganalytics_workspace_id    = data.azurerm_log_analytics_workspace.cospi.workspace_id
  loganalytics_workspace_key   = data.azurerm_log_analytics_workspace.cospi.primary_shared_key
  storage_account_name         = module.vmdiagnosticslogssa.storage_account_name
  storage_account_key          = module.vmdiagnosticslogssa.primary_access_key
  client_id                    = ""
  diskencryption_keyvault      = module.keyvault.key_vault_id
  backup_resource_group_name   = module.backuprecoveryrg.resource_group_name
  recovery_vault_name          = module.recoveryservice.services_vault_name
  backup_policy_id             = module.recoveryservice.backup_policy_id
  custom_emails                = var.custom_emails
  domain_name                  = var.domain_name
  ou_path                      = var.ou_path
  domain_user_name             = var.domain_user_name
  domain_user_password         = var.domain_user_password
  admin_username               = ""
  admin_password               = var.admin_password
  encryptappsp_key_password    = var.encryptappsp_key_password
  enforce_vm_naming_convention = var.environment == "production" ? false : true
  azurerm_image_id             = var.environment == "production" ? var.azurerm_image_id : ""
  publisher                    = var.environment == "production" ? "" : "MicrosoftWindowsServer"
  offer                        = var.environment == "production" ? "" : "WindowsServer"
  sku                          = var.environment == "production" ? "" : "2016-Datacenter"
  vmimageversion               = var.environment == "production" ? "" : "latest"
  vm_name_suffix               = "1"
  storage_data_disk_1          = "UEMCBMPINFO1P1_DataDisk_1"
  storage_data_disk_2          = "UEMCBMPINFO1P1_DataDisk_2"

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