module "powerbigateway1vm" {
  source                       = "../../modules/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = var.environment == "production" ? "PBI" : "KIP"
  vm_environment               = var.environment == "production" ? "PD1" : upper(var.environment_acronym)
  vm_region                    = var.location_acronym
  vm_workload_desc             = "PBI"
  enforce_vm_naming_convention = var.environment == "production" ? false : true
  resource_group_location      = module.applicationrg.resource_group_location
  resource_group_name          = module.applicationrg.resource_group_name
  tags                         = var.tags
  subnet_id                    = module.pbi1subnet.subnet_id
  count_value                  = var.count_value_pbi1vm
  vm_size                      = var.vm_size_pbi1vm
  availability_set_id          = module.powerbigatewayas.availability_set_id
  azurerm_image_id             = ""
  publisher                    = "MicrosoftWindowsServer"
  offer                        = "WindowsServer"
  sku                          = "2016-Datacenter"
  storage_uri                  = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size               = var.data_disk_size_pbi1vm
  template_file                = ""
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
    "${var.application_acronym}PBI1${var.environment == "production" ? "PD1" : var.environment_acronym}ADMIN",
  )
  admin_password               = var.vm_admin_password
  encryptappsp_key_password    = ""
}
