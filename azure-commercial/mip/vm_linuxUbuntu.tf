resource "azurerm_marketplace_agreement" "cis_ubuntu" {
  publisher = "center-for-internet-security-inc"
  offer     = "cis-ubuntu-linux-1804-l1"
  plan      = "cis-ubuntu1804-l1"
}

resource "azurerm_network_interface" "mip_ubuntu_nic" {
  name                          = lower("nic-${var.location_acronym}-${var.application_acronym}-${var.mip_linuxvm_name_prefix1}u-${var.environment_acronym}")
  resource_group_name           = module.mathworks_rg_shared.resource_group_name
  location                      = module.mathworks_rg_shared.resource_group_location
  enable_accelerated_networking = true

  ip_configuration {
    name                          = upper("VML${var.location_acronym}${var.application_acronym}${var.mip_linuxvm_name_prefix1}u${var.environment_acronym}-config")
    subnet_id                     = module.subnet_license_manager.subnet_id
    private_ip_address_allocation = "dynamic"
  }
  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "mipubuntuinstance" {
  name                             = upper("VML${var.location_acronym}${var.application_acronym}${var.mip_linuxvm_name_prefix1}u${var.environment_acronym}")
  location                         = module.mathworks_rg_shared.resource_group_location
  resource_group_name              = module.mathworks_rg_shared.resource_group_name
  network_interface_ids            = [azurerm_network_interface.mip_ubuntu_nic.id]
  size                             = var.mip_linuxvm_size
  availability_set_id              = module.availabilityset_linuxvm.availability_set_id
  tags                             = var.tags

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = "center-for-internet-security-inc"
    offer     = "cis-ubuntu-linux-1804-l1"
    sku       = "cis-ubuntu1804-l1"
    version   = "latest"
  }

  plan {
    publisher = "center-for-internet-security-inc"
    product   = "cis-ubuntu-linux-1804-l1"
    name      = "cis-ubuntu1804-l1"
  }

  computer_name  = upper("VML${var.location_acronym}${var.application_acronym}${var.mip_linuxvm_name_prefix1}u${var.environment_acronym}")
  admin_username = var.mip_linuxvm_adminname
  admin_password = var.mathworks_vm_admin_password

  disable_password_authentication = false
  
  boot_diagnostics {
   storage_account_uri = module.vmdiagnosticslogs.primary_blob_endpoint
  }

  os_disk {
    name              = "${upper("VML${var.location_acronym}${var.application_acronym}${var.mip_linuxvm_name_prefix1}u${var.environment_acronym}")}_OSDisk"
    caching           = "ReadWrite"
    disk_size_gb      = 256
    storage_account_type = "Premium_LRS"
  }
}

resource "azurerm_managed_disk" "managed_disk_lnxuvminstance_data_1" {
    name              = "${upper("VML${var.location_acronym}${var.application_acronym}${var.mip_linuxvm_name_prefix1}u${var.environment_acronym}")}_DataDisk_1"
    location                         = module.mathworks_rg_shared.resource_group_location
    resource_group_name              = module.mathworks_rg_shared.resource_group_name
    storage_account_type = "Premium_LRS"
    create_option     = "Empty"
    disk_size_gb      = "1024"
    tags                 = var.tags
  }

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_lnxuvminstance_data_1" {
  managed_disk_id    = azurerm_managed_disk.managed_disk_lnxuvminstance_data_1.id
  virtual_machine_id = azurerm_linux_virtual_machine.mipubuntuinstance.id
  lun                = 0
  caching            = "ReadWrite"
}

resource "azurerm_managed_disk" "managed_disk_lnxuvminstance_data_2" {
    name              = "${upper("VML${var.location_acronym}${var.application_acronym}${var.mip_linuxvm_name_prefix1}u${var.environment_acronym}")}_DataDisk_2"
    location                         = module.mathworks_rg_shared.resource_group_location
    resource_group_name              = module.mathworks_rg_shared.resource_group_name
    storage_account_type = "Premium_LRS"
    create_option     = "Empty"
    disk_size_gb      = "1024"
    tags                 = var.tags
  }

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_lnxuvminstance_data_2" {
  managed_disk_id    = azurerm_managed_disk.managed_disk_lnxuvminstance_data_2.id
  virtual_machine_id = azurerm_linux_virtual_machine.mipubuntuinstance.id
  lun                = 1
  caching            = "ReadWrite"
}
