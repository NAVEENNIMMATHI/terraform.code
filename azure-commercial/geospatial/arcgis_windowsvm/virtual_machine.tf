data "azurerm_subscription" "subscription_id" {
}

data "azurerm_client_config" "current" {
}

resource "azurerm_network_interface" "network_interface_card" {
  count = var.count_value

  #name                              = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}-nic"
  name                              = var.enforce_vm_naming_convention == true ? "VM${upper(var.vm_region)}${upper(var.project_name)}${upper(var.vm_workload_desc)}${count.index + 1}${upper(var.vm_environment)}-NIC${count.index + 1}" : (var.network_interface_card_name == "" ? "UEMC${upper(var.application_acronym)}${upper(var.project_name)}${count.index + 1}${upper(var.vm_environment)}${var.vm_name_suffix}-nic" : var.network_interface_card_name) #USE THIS VARIABLE                               
  resource_group_name               = var.resource_group_name
  location                          = var.resource_group_location
  enable_accelerated_networking     = var.enable_accelerated_networking

  ip_configuration {
    #name                          = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}-config"
    name                          = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}-NIC${count.index + 1}-config" : (var.ip_configuration_name == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}${var.vm_name_suffix}-config" : var.ip_configuration_name) #USE THIS VARIABLE"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_virtual_machine" "virtual_machine" {
  count = var.count_value

  #name                            = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}"
  name                             = var.enforce_vm_naming_convention == true ? "VM${upper(var.os_type_letter)}${upper(var.vm_region)}${upper(var.project_name)}${upper(var.vm_workload_desc)}${count.index + 1}${upper(var.vm_environment)}" : (var.virtual_machine_name == "" ? "UEMC${upper(var.application_acronym)}${upper(var.project_name)}${count.index + 1}${upper(var.vm_environment)}${var.vm_name_suffix}" : var.virtual_machine_name) #USE THIS VARIABLE"
  resource_group_name              = var.resource_group_name
  location                         = var.resource_group_location
  network_interface_ids            = [element(azurerm_network_interface.network_interface_card.*.id, count.index)]
  vm_size                          = var.vm_size
  availability_set_id              = var.availability_set_id
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

  dynamic "storage_os_disk" {
    for_each = var.os_disk_override == null ? [] : tolist([var.os_disk_override]) 
    content {
      #name              = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}_OSDisk"
      name              = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}_OS_Disk" : (var.storage_os_disk == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}${var.vm_name_suffix}_OSDisk" : var.storage_os_disk) #USE THIS VARIABLE"
      caching           = "ReadWrite"
      create_option     = var.os_disk_override.create_option
      managed_disk_type = var.os_disk_override.managed_disk_type
    }
  }

  dynamic "storage_data_disk" {
    for_each = var.data_disk_1_override == null ? [] : tolist([var.data_disk_1_override])
    content {
      #name              = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}_DataDisk_1"
      name              = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}_DataDisk_1" : (var.storage_data_disk_1 == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}_DataDisk_1" : var.storage_data_disk_1) #USE THIS VARIABLE"
      managed_disk_type = var.data_disk_1_override.managed_disk_type
      create_option     = var.data_disk_1_override.create_option
      lun               = 0
      disk_size_gb      = var.data_disk_1_override.disk_size_gb
    }
  }

  dynamic "storage_data_disk" {
    for_each = var.data_disk_2_override == null ? [] : tolist([var.data_disk_2_override])
    content {
      #name              = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}_DataDisk_2"
      name              = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}_DataDisk_2" : (var.storage_data_disk_2 == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}_DataDisk_2" : var.storage_data_disk_2) #USE THIS VARIABLE"
      managed_disk_type = var.data_disk_1_override.managed_disk_type
      create_option     = var.data_disk_1_override.create_option
      lun               = 1
      disk_size_gb      = var.data_disk_1_override.disk_size_gb
    }
  }

  dynamic "storage_data_disk" {
    for_each = var.data_disk_3_override == null ? [] : tolist([var.data_disk_3_override])
    content {
      #name              = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}_DataDisk_2"
      name              = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}_DataDisk_3" : (var.storage_data_disk_3 == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}_DataDisk_3" : var.storage_data_disk_3) #USE THIS VARIABLE"
      managed_disk_type = var.data_disk_3_override.managed_disk_type
      create_option     = var.data_disk_3_override.create_option
      lun               = 2
      disk_size_gb      = var.data_disk_3_override.disk_size_gb
    }
  }

  dynamic "storage_data_disk" {
    for_each = var.data_disk_4_override == null ? [] : tolist([var.data_disk_4_override])
    content {
      #name              = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}_DataDisk_2"
      name              = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}_DataDisk_4" : (var.storage_data_disk_4 == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}_DataDisk_4" : var.storage_data_disk_4) #USE THIS VARIABLE"
      managed_disk_type = var.data_disk_4_override.managed_disk_type
      create_option     = var.data_disk_4_override.create_option
      lun               = 3
      disk_size_gb      = var.data_disk_4_override.disk_size_gb
    }
  }
  dynamic "storage_data_disk" {
    for_each = var.data_disk_5_override == null ? [] : tolist([var.data_disk_5_override])
    content {
      #name              = "UEMC${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment}_DataDisk_2"
      name              = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}_DataDisk_5" : (var.storage_data_disk_5 == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}_DataDisk_5" : var.storage_data_disk_5) #USE THIS VARIABLE"
      managed_disk_type = var.data_disk_5_override.managed_disk_type
      create_option     = var.data_disk_5_override.create_option
      lun               = 4
      disk_size_gb      = var.data_disk_5_override.disk_size_gb
    }
  }

  os_profile {
    computer_name = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}" : (var.virtual_machine_name == "" ? "UEMC${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}${var.vm_name_suffix}" : var.virtual_machine_name) #USE THIS VARIABLE"
    #admin_username = "${lower("${var.prefix}${var.application_acronym}${var.application_name}${count.index+1}${var.vm_environment_os}ADMIN")}"
    admin_username = var.enforce_vm_naming_convention == true ? "VM${var.vm_region}${var.project_name}${var.vm_workload_desc}${count.index + 1}${var.vm_environment}ADMIN" : (var.admin_username == "" ? lower("${var.application_acronym}${var.project_name}${count.index + 1}${var.vm_environment}${var.vm_name_suffix}admin") : "${var.admin_username}") #USE THIS VARIABLE
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = var.storage_uri
  }

  # To enable and link User Assigned Identity to the VM
  dynamic "identity" {
    for_each = var.user_assigned_identity == null ? [] : tolist([var.user_assigned_identity])
    content {
      type         = var.user_assigned_identity.type
      identity_ids = var.user_assigned_identity.identity_ids
    }
  }

  /*
  Tried with similar block for System Assigned Identity but it gave below error. In future to be given
  to have single identity block for both the type or it can be terraform limitation which can 
  handle only one type of identity at a time.
  
  dynamic "identity" {
    for_each = var.system_assigned_identity == null ? [] : tolist([var.system_assigned_identity])
    content {
    type                       = var.system_assigned_identity.type
    }
  }
*/
  /*
Error:
Release
https://co-azurecore.visualstudio.com/KpmgAdvisoryCloud/_releaseProgress?_a=release-environment-logs&releaseId=9892&environmentId=32867

2020-08-03T20:41:16.8560098Z Error: identity: attribute supports 1 item maximum, config has 2 declared
2020-08-03T20:41:16.8560429Z 
2020-08-03T20:41:16.8560998Z   on ..\modules12\virtual_machine_universal_win2016\virtual_machine.tf line 21, in resource "azurerm_virtual_machine" "virtual_machine":
2020-08-03T20:41:16.8561547Z   21: resource "azurerm_virtual_machine" "virtual_machine" {
*/
}

resource "azurerm_virtual_machine_extension" "custom_ext_win_vm" {
  count = var.count_value

  name                       = "CustomScriptExtension"
  virtual_machine_id         = element(azurerm_virtual_machine.virtual_machine.*.id, count.index)
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.9"
  auto_upgrade_minor_version = var.auto_upgrade_minor_version
  settings                   = <<SETTINGS
    {
      "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(var.template_file)}')) | Out-File -filepath win_initialise_data_disk.ps1\" && powershell -ExecutionPolicy Unrestricted -File win_initialise_data_disk.ps1"
    }
SETTINGS

  tags = var.tags
}
