module "spipaasuspbigtwyvm" {
  source                       = "../../modules/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = "SPI"
  os_type_letter               = upper(var.os_letter)
  vm_environment               = upper(var.environment_acronym)
  vm_region                    = upper(var.location_acronym)
  vm_workload_desc             = "DG"
  enforce_vm_naming_convention = true
  resource_group_location      = module.applicationrg["us"].resource_group_location
  resource_group_name          = module.applicationrg["us"].resource_group_name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.spipaaspbi_subnet["us"].id
  count_value                  = var.count_value_spipaaspbi
  vm_size                      = var.vm_size_pbi
  availability_set_id          = azurerm_availability_set.availability_set["us"].id
  azurerm_image_id             = ""
  publisher                    = "MicrosoftWindowsServer"
  offer                        = "WindowsServer"
  sku                          = "2019-Datacenter"
  storage_uri                  =  module.spipaasvmdiagnosticslogssa["us"].primary_blob_endpoint
  data_disk_size               =  var.data_disk_size_spipaaspbi
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
}

module "spipaasukpbigtwyvm" {
  source                       = "../../modules/virtual_machine_universal_win2016"
  application_acronym          = upper(var.application_acronym)
  project_name                 = "SPI"
  os_type_letter               = "W"
  vm_environment               = upper(var.environment_acronym)
  vm_region                    = upper(var.location_acronym_uk)
  vm_workload_desc             = "DG"
  enforce_vm_naming_convention = true
  resource_group_location      = module.applicationrg[var.vm_location].resource_group_location
  resource_group_name          = module.applicationrg[var.vm_location].resource_group_name
  tags                         = var.tags
  subnet_id                    = azurerm_subnet.spipaaspbi_subnet[var.vm_location].id
  count_value                  = var.count_value_spipaaspbi_uk
  vm_size                      = var.vm_size_pbi
  availability_set_id          = azurerm_availability_set.availability_set[var.vm_location].id
  azurerm_image_id             = ""
  publisher                    = "MicrosoftWindowsServer"
  offer                        = "WindowsServer"
  sku                          = "2019-Datacenter"
  storage_uri                  = module.spipaasvmdiagnosticslogssa[var.vm_location].primary_blob_endpoint
  data_disk_size               = var.data_disk_size_spipaaspbi
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
}

resource "azurerm_network_interface" "network_interface_card_pbi" {
   for_each = var.pbi_vm
  name                              = "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}-NIC${each.value.count}"
  resource_group_name               = module.applicationrg[each.value.region].resource_group_name
  location                          = module.applicationrg[each.value.region].resource_group_location
  enable_accelerated_networking     = var.enable_accelerated_networking

  ip_configuration {
    name                          = "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}-NIC${each.value.count}-CONFIG"
    subnet_id                     = azurerm_subnet.spipaaswst_subnet[each.value.region].id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "virtual_machine_pbi" {
  for_each = var.pbi_vm

  name                             = "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}"
  resource_group_name              = module.applicationrg[each.value.region].resource_group_name
  location                         = module.applicationrg[each.value.region].resource_group_location
  network_interface_ids            = [azurerm_network_interface.network_interface_card_pbi[each.key].id]
  vm_size                          = var.vm_size_spipaaswst
  availability_set_id              = azurerm_availability_set.availability_set[each.value.region].id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  license_type                     = "Windows_Server"

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }

  storage_image_reference {

    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.vmimageversion
    id        = var.azurerm_image_id
  }
storage_os_disk {
    name              = "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}_OS_Disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  

  dynamic "storage_data_disk" {
    for_each = var.data_disk_1_override == null ? [] : tolist([var.data_disk_1_override])
    content {
      name              = "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}_DataDisk_1"
      managed_disk_type = var.data_disk_1_override.managed_disk_type
      create_option     = var.data_disk_1_override.create_option
      lun               = 0
      disk_size_gb      = var.data_disk_1_override.disk_size_gb
    }
  }

  dynamic "storage_data_disk" {
    for_each = var.data_disk_2_override == null ? [] : tolist([var.data_disk_2_override])
    content {
      name              = "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}_DataDisk_2"
      managed_disk_type = var.data_disk_1_override.managed_disk_type
      create_option     = var.data_disk_1_override.create_option
      lun               = 1
      disk_size_gb      = var.data_disk_1_override.disk_size_gb
    }
  }

  os_profile {
    computer_name =  "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}" 
    admin_username = "VM${upper(each.value.location_acronym)}SPIDG${each.value.count}${upper(var.environment_acronym)}ADMIN" 
    admin_password = var.vm_admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = module.spipaasvmdiagnosticslogssa[each.value.region].primary_blob_endpoint
  }
}

  resource "azurerm_virtual_machine_extension" "custom_ext_win_vm_pbi" {
    for_each = var.pbi_vm

  name                       = "CustomScriptExtension"
  virtual_machine_id         = azurerm_virtual_machine.virtual_machine_pbi[each.key].id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.9"
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  settings                   = <<SETTINGS
    {
      "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.ps1.rendered)}')) | Out-File -filepath win_initialise_data_disk.ps1\" && powershell -ExecutionPolicy Unrestricted -File win_initialise_data_disk.ps1"
    }
SETTINGS

  tags = var.tags
}
