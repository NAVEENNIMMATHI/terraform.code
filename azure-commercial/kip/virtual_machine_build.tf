resource "azurerm_network_interface" "network_interface_card" {
  count                            = (var.environment == "development" || var.environment == "qa") ? var.count_value_app1vm : 0 

  name                             = "nic-${var.location_acronym}-${var.application_acronym}-build-${var.environment_acronym}-${count.index + 2}"
  resource_group_name              = module.applicationrg.resource_group_name
  location                         = module.applicationrg.resource_group_location
  ip_configuration {
    name                           = "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}-config" 
    subnet_id                      = module.app1subnet.subnet_id
    private_ip_address_allocation  = "Dynamic"
  }

  tags                             = var.tags
}

resource "azurerm_virtual_machine" "virtual_machine" {
  count                            = (var.environment == "development" || var.environment == "qa") ? var.count_value_app1vm : 0

  name                             = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}BUILD${count.index + 1}${upper(var.environment_acronym)}"
  resource_group_name              = module.applicationrg.resource_group_name
  location                         = module.applicationrg.resource_group_location
  network_interface_ids            = ["${element(azurerm_network_interface.network_interface_card.*.id, count.index)}"]
  vm_size                          = var.vm_size_app1vm
  availability_set_id              = module.applicationas.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  license_type                     = "Windows_Server"
  storage_image_reference {
    publisher                      = "MicrosoftWindowsServer"
    offer                          = "WindowsServer"
    sku                            = "2016-Datacenter"
    version                        = "latest"
    id                             = ""
  }
  dynamic "storage_os_disk" {
    for_each                       = var.os_disk_override == null ? [] : tolist([var.os_disk_override]) 
    content {
    name                           = var.storage_os_disk == "" ? "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_OSDisk" : var.storage_os_disk 
    caching                        = "ReadWrite"
    create_option                  = var.os_disk_override.create_option
    managed_disk_type              = var.managed_disk_type
      }
  }
  dynamic "storage_data_disk" {
    for_each                       = var.data_disk_1_override == null ? [] : tolist([var.data_disk_1_override])
    content {
    name                           = var.storage_data_disk_1 == "" ? "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_DataDisk_1" : var.storage_data_disk_1 
    managed_disk_type              = var.data_disk_1_override.managed_disk_type
    create_option                  = var.data_disk_1_override.create_option
    lun                            = 0
    disk_size_gb                   = var.data_disk_1_override.disk_size_gb
    }
  }
  dynamic "storage_data_disk" {
    for_each                       = var.data_disk_2_override == null ? [] : tolist([var.data_disk_2_override])
    content {
    name                           = var.storage_data_disk_2 == "" ? "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_DataDisk_2" : var.storage_data_disk_2 
    managed_disk_type              = var.data_disk_1_override.managed_disk_type
    create_option                  = var.data_disk_1_override.create_option
    lun                            = 1
    disk_size_gb                   = var.data_disk_1_override.disk_size_gb
    }
  }
  dynamic "storage_data_disk" {
    for_each                       = var.data_disk_3_override == null ? [] : tolist([var.data_disk_3_override])
    content {
    name                           = var.storage_data_disk_3 == "" ? "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_DataDisk_3" : var.storage_data_disk_3 
    managed_disk_type              = var.data_disk_3_override.managed_disk_type
    create_option                  = var.data_disk_3_override.create_option
    lun                            = 2
    disk_size_gb                   = var.data_disk_3_override.disk_size_gb
    }
  }
  dynamic "storage_data_disk" {
    for_each                       = var.data_disk_4_override == null ? [] : tolist([var.data_disk_4_override])
    content {
    name                           = var.storage_data_disk_4 == "" ? "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_DataDisk_4" : var.storage_data_disk_4 
    managed_disk_type              = var.data_disk_4_override.managed_disk_type
    create_option                  = var.data_disk_4_override.create_option
    lun                            = 3
    disk_size_gb                   = var.data_disk_4_override.disk_size_gb
    }
  }
  dynamic "storage_data_disk" {
    for_each                       = var.data_disk_5_override == null ? [] : tolist([var.data_disk_5_override])
    content {
    name                           = var.storage_data_disk_5 == "" ? "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}_DataDisk_5" : var.storage_data_disk_5 
    managed_disk_type              = var.data_disk_5_override.managed_disk_type
    create_option                  = var.data_disk_5_override.create_option
    lun                            = 4
    disk_size_gb                   = var.data_disk_5_override.disk_size_gb
    }
  }
  os_profile {
    computer_name                  = "VMW${upper(var.application_acronym)}${count.index+1}${upper(var.environment_acronym)}" 
    admin_username                 = lower("${var.application_acronym}${var.environment_acronym}ADMIN",)
    admin_password                 = var.vm_admin_password
  } 
  os_profile_windows_config {
    provision_vm_agent             = true
  }
  boot_diagnostics {
    enabled                        = "true"
    storage_uri                    = module.vmdiagnosticslogssa.primary_blob_endpoint
  }

  tags                             = var.tags

  lifecycle {
    prevent_destroy                = false
  }
}

resource "azurerm_virtual_machine_extension" "custom_ext_win_vm" {
  name                             = "CustomScriptExtension"
  virtual_machine_id               = element(azurerm_virtual_machine.virtual_machine.*.id, count.index)
  publisher                        = "Microsoft.Compute"
  type                             = "CustomScriptExtension"
  type_handler_version             = "1.9"
  count                            = var.environment == "development" ? var.count_value_app1vm : 0
  auto_upgrade_minor_version       = false
  settings                         = <<SETTINGS
    {
        "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode("")}')) | Out-File -filepath win_initialise_data_disk.ps1\" && powershell -ExecutionPolicy Unrestricted -File win_initialise_data_disk.ps1"
    }

SETTINGS

  tags                             = var.tags

}