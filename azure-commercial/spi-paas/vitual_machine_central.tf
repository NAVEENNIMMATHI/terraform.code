module "spipaascenbuildvm" {
  source                       = "../../modules/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = "SPI"
  os_type_letter               = "W"
  vm_environment               = upper(var.environment_acronym)
  vm_region                    = upper(var.location_acronym)
  vm_workload_desc             = "WK"
  enforce_vm_naming_convention = true
  resource_group_location      = module.applicationrg_central.resource_group_location
  resource_group_name          = module.applicationrg_central.resource_group_name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.spiwst1_subnet_central.id
  count_value                  = var.count_value_spipaascentral
  vm_size                      = var.vm_size_spipaaswst
  availability_set_id          = module.centralworkstationas.availability_set_id
  azurerm_image_id             = ""
  publisher                    = "MicrosoftWindowsServer"
  offer                        = "WindowsServer"
  sku                          = "2019-Datacenter"
  storage_uri                  = module.spipaascentralvmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size               = var.data_disk_size_spipaaswst
  template_file                = data.template_file.ps1.rendered
  template_file_xml            = ""
  loganalytics_workspace_id    = ""
  loganalytics_workspace_key   = ""
  storage_account_name         = ""
  storage_account_key          = ""
  client_id                    = ""
  diskencryption_keyvault      = ""
  backup_resource_group_name   = ""
  recovery_vault_name          = ""
  backup_policy_id             = ""
  domain_name                  = ""
  ou_path                      = ""
  domain_user_name             = ""
  domain_user_password         = ""
  admin_username = lower(
    "${var.application_acronym}PAN1${var.environment_acronym}ADMIN",
  )
  admin_password               = var.vm_admin_password
  encryptappsp_key_password    = ""
   
   data_disk_1_override = {
      create_option = "Empty"
      managed_disk_type = "Standard_LRS"
      disk_size_gb = 512
  }
  data_disk_2_override = {
      create_option = "Empty"
      managed_disk_type = "Standard_LRS"
      disk_size_gb = 512
  }
}