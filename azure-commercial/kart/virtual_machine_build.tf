module "krtapp1vm" {
  source                     = "../../modules/virtual_machine_universal_win2016"
  project_name               = var.environment == "production" ? "APP" : "KRT"
  application_acronym        = upper(var.application_acronym)
  vm_environment             = upper(var.environment_acronym)
  vm_region                  = "USE"
  vm_workload_desc           = "APP"
  resource_group_location    = module.applicationrg.resource_group_location
  resource_group_name        = module.applicationrg.resource_group_name
  tags                       = var.tags
  subnet_id                  = module.krtapp1subnet.subnet_id
  count_value                = var.count_value_krtapp1vm
  vm_size                    = var.vm_size_app
  availability_set_id        = module.availabilityset.availability_set_id
  azurerm_image_id           = ""
  publisher                  = "MicrosoftWindowsServer"
  offer                      = "WindowsServer"
  sku                        = "2016-Datacenter"
  vmimageversion             = "latest"
  storage_uri                = module.vmdiagnosticslogssa.primary_blob_endpoint
  data_disk_size             = "512"
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = data.template_file.xml.rendered
  loganalytics_workspace_id  = ""
  loganalytics_workspace_key = ""
  storage_account_name       = ""
  storage_account_key        = ""
  client_id                  = ""
  diskencryption_keyvault    = ""
  backup_resource_group_name = ""
  recovery_vault_name        = ""
  backup_policy_id           = ""
  admin_username = lower(
    "${var.application_acronym}APP1${var.environment_acronym}ADMIN",
  )
  admin_password               = var.admin_password
  enforce_vm_naming_convention = var.environment == "production" ? false : true
  virtual_machine_name         = var.environment == "production" ? "UEMCKRTAPP1P"            : upper("VMW${var.location_acronym}${var.application_acronym}B01${var.environment_acronym}")
  ip_configuration_name        = var.environment == "production" ? "UEMCKRTAPP1P-config"     : lower("VMW${var.location_acronym}${var.application_acronym}B01${var.environment_acronym}-config")
  network_interface_card_name  = var.environment == "production" ? "UEMCKRTAPP1P-nic"        : "nic-${var.location_acronym}-${var.application_acronym}-B-${var.environment_acronym}-1"
  storage_os_disk              = var.environment == "production" ? "UEMCKRTAPP1P_OSDisk"     : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}B01${upper(var.environment_acronym)}_OS_Disk_1"
  storage_data_disk_1          = var.environment == "production" ? "UEMCKRTAPP1P_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}B01${upper(var.environment_acronym)}_DataDisk_1"

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