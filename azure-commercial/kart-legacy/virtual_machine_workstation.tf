module "krtworkstation1vm" {
  source                     = "../../modules12/virtual_machine_universal_win2016"
  project_name               = "WST"
  application_acronym        = "KRT"
  vm_environment             = var.application_environment_1
  resource_group_location    = module.applicationrg.resource_group_location
  resource_group_name        = module.applicationrg.resource_group_name
  tags                       = var.tags
  subnet_id                  = module.krtapp1subnet.subnet_id
  count_value                = var.count_value_krtwrkstnvm
  vm_size                    = var.vm_size_wrkstn
  availability_set_id        = module.workstationas.availability_set_id
  azurerm_image_id           = var.target_deployment_environment == "prod" ? "" : data.azurerm_image.app1_vm_image.id
  publisher                  = var.target_deployment_environment == "prod" ? "MicrosoftWindowsServer" : ""
  offer                      = var.target_deployment_environment == "prod" ? "WindowsServer" : ""
  sku                        = var.target_deployment_environment == "prod" ? "2016-Datacenter" : ""
  vmimageversion             = var.target_deployment_environment == "prod" ? "latest" : ""
  storage_uri                = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size             = "512"
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = data.template_file.xml.rendered
  loganalytics_workspace_id  = data.azurerm_log_analytics_workspace.cospi.workspace_id
  loganalytics_workspace_key = data.azurerm_log_analytics_workspace.cospi.primary_shared_key
  storage_account_name       = module.vmdiagnosticslogssa.storage_account_name
  storage_account_key        = module.vmdiagnosticslogssa.primary_access_key
  client_id                  = data.azuread_service_principal.encryptappsp.application_id
  diskencryption_keyvault    = module.keyvault.key_vault_id
  backup_resource_group_name = module.backuprecoveryrg.resource_group_name
  recovery_vault_name        = module.recoveryservice.services_vault_name
  backup_policy_id           = module.recoveryservice.backup_policy_id

  #action_group_id            = "${azurerm_monitor_action_group.action_group_alert.id}"
  domain_name          = var.domain_name
  ou_path              = var.ou_path
  domain_user_name     = var.domain_user_name
  domain_user_password = var.domain_user_password
  admin_username = lower(
    "${var.application_acronym}WST1${var.application_environment_1}ADMIN",
  )
  admin_password            = var.admin_password
  encryptappsp_key_password = var.encryptappsp_key_password
  enforce_vm_naming_convention = false
}

