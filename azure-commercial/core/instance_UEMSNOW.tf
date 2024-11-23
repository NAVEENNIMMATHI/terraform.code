locals {
  snowvm_name = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCSNOWNP1" : "VMW${upper(var.location_acronym)}SNOW1${upper(var.environment_acronym)}"
}

resource "azurerm_network_interface" "snownic" {
  count = (var.environment_acronym == "dv" || var.environment_acronym == "pd")  ? 1 : 0
  
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "uemcsnownp1660" : "nic-${var.location_acronym}-snow-vm-${var.environment_acronym}-1"
  resource_group_name = azurerm_resource_group.hubvnet.name
  location            = azurerm_resource_group.hubvnet.location

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.sub_aaddsdomain_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.environment == "production" ? azurerm_public_ip.snowpip.id : ""
    #public_ip_address_id          = azurerm_public_ip.snowpip.id
  }

  # network_security_group_id = azurerm_network_security_group.UEMCSNOWNP1-nsg.id
  tags = var.tags_SNOW
}

resource "azurerm_virtual_machine" "UEMSNOW" {
  count = (var.environment_acronym == "dv" || var.environment_acronym == "pd")  ? 1 : 0

  name                  = local.snowvm_name
  location              = azurerm_resource_group.hubvnet.location
  resource_group_name   = azurerm_resource_group.hubvnet.name
  network_interface_ids = [element(azurerm_network_interface.snownic.*.id, count.index)]
  vm_size               = "Standard_B4ms"

  #delete_data_disk_on_termination = true
  delete_os_disk_on_termination = true

  license_type          = "Windows_Server"
  os_profile_windows_config {
    provision_vm_agent        = "true"
    enable_automatic_upgrades = "true"
  }
  storage_image_reference {
    #id=var.eu_2016_windows_hardened_image
    id        = var.environment == "production" ? var.eu_2016_windows_hardened_image : ""
    publisher = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer     = var.environment == "production" ? "" : "WindowsServer"
    sku       = var.environment == "production" ? "" : "2016-Datacenter"
    version   = var.environment == "production" ? "" : "latest"
  }
  storage_os_disk {
    name              = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "UEMCSNOWNP1_disk1_76b7e7ed8e5d49948a172f4969b5ff67" : "${local.snowvm_name}_disk1"
    caching           = "None"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }
  os_profile {
    computer_name  = local.snowvm_name
    admin_username = var.uemsnowvm_admin_username
    admin_password = var.common_virtual_machine_password
  }
  boot_diagnostics {
    enabled     = "true"
    storage_uri = "https://eastushubvnetrgdiag.blob.core.windows.net/"
  }

  tags = var.tags_SNOW
  lifecycle {
    prevent_destroy = false

    ignore_changes = [
      delete_os_disk_on_termination,
      delete_data_disks_on_termination
    ]
  }
}

resource "azurerm_virtual_machine_extension" "uemsnow_custom_ext_win_vm" {
  count = var.environment_acronym == "dv" ? 1 : 0

  name                       = "CustomScriptExtension"
  virtual_machine_id         = element(azurerm_virtual_machine.UEMSNOW.*.id, count.index)
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.9"
  auto_upgrade_minor_version = false
  settings                   = <<SETTINGS
    {
        "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.ps1.rendered)}')) | Out-File -filepath win_initialise_data_disk.ps1\" && powershell -ExecutionPolicy Unrestricted -File win_initialise_data_disk.ps1"
    }
  SETTINGS

  tags = var.tags_SNOW
}