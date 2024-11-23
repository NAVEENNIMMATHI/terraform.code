resource "azurerm_network_interface" "network_interface_card" {
  name                = "nic-${var.location_acronym}-${var.application_acronym}-vm-${var.environment_acronym}-${count.index + 1}"
  resource_group_name = module.timrg.resource_group_name
  location            = module.timrg.resource_group_location
  count               = var.vm_count
  ip_configuration {
    name                          = "nic-${var.location_acronym}-${var.application_acronym}-vm-${var.environment_acronym}-${count.index + 1}-config"
    subnet_id                     = module.applicationsubnet.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags


}

resource "azurerm_virtual_machine" "timworkstation1vm" {
  name                  = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 1}${upper(var.environment_acronym)}"
  resource_group_name   = module.timrg.resource_group_name
  location              = module.timrg.resource_group_location
  network_interface_ids = ["${element(azurerm_network_interface.network_interface_card.*.id, count.index)}"]
  vm_size               = var.vm_size
  count                 = var.vm_count
  availability_set_id   = module.availabilityset.availability_set_id

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  license_type = "Windows_Server"

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }

  storage_image_reference {
    // id = "${var.azurerm_image_id}"
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 1}${upper(var.environment_acronym)}_OS_Disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name              = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 1}${upper(var.environment_acronym)}_DataDisk"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "200"
  }

  storage_data_disk {
    name              = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 1}${upper(var.environment_acronym)}_DataDisk2"
    managed_disk_type = "Standard_LRS"
    create_option     = "Empty"
    lun               = 1
    disk_size_gb      = "200"
  }

  os_profile {
    computer_name  = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 1}${upper(var.environment_acronym)}"
    admin_username = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index + 1}${upper(var.environment_acronym)}ADMIN"
    admin_password = var.vm_admin_password


  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = data.azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint
  }

}
resource "azurerm_virtual_machine_extension" "custom_ext_win_vm" {
  name                 = "CustomScriptExtension"
  virtual_machine_id   = element(azurerm_virtual_machine.timworkstation1vm.*.id, count.index)
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  count                = var.vm_count
  settings             = <<SETTINGS
    {
        "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.ps1.rendered)}')) | Out-File -filepath win_initialise_data_disk.ps1\" && powershell -ExecutionPolicy Unrestricted -File win_initialise_data_disk.ps1"
    }
SETTINGS

  tags = var.tags
}

resource "azurerm_backup_protected_vm" "backup_win_vm" {
  source_vm_id        = "${data.azurerm_subscription.subscription_id.id}/resourceGroups/${module.timrg.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${element(azurerm_virtual_machine.timworkstation1vm.*.name, count.index)}"
  backup_policy_id    = module.recoveryservice.backup_policy_id
  recovery_vault_name = module.recoveryservice.services_vault_name
  resource_group_name = module.backuprecoveryrg.resource_group_name
  count               = var.vm_count

}

resource "azurerm_virtual_machine_extension" "IaaSDiagnostics_logs_ext_win_vm" {
  name                 = "IaaSDiagnostics"
  virtual_machine_id   = element(azurerm_virtual_machine.timworkstation1vm.*.id, count.index)
  publisher            = "Microsoft.Azure.Diagnostics"
  type                 = "IaaSDiagnostics"
  type_handler_version = "1.5"
  count                = var.vm_count
  settings             = <<SETTINGS
    {
        "xmlCfg": "${base64encode(data.template_file.xml.rendered)}",
        "storageAccount": "${module.vmdiagnosticslogssa.storage_account_name}"
    }
SETTINGS
  protected_settings   = <<SETTINGS
    {

         "storageAccountName":"${module.vmdiagnosticslogssa.storage_account_name}",
         "storageAccountKey": "${module.vmdiagnosticslogssa.primary_access_key}"

    }
SETTINGS

  tags = var.tags
}

resource "azurerm_monitor_action_group" "action_group_alert" {
  name                = "actiongroup"
  resource_group_name = module.timrg.resource_group_name

  short_name = "notifcation"
  email_receiver {
    name          = "notifyme"
    email_address = var.custom_emails
  }
  tags = var.tags
}