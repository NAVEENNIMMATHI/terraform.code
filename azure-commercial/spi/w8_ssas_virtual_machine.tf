# Version 1
resource "azurerm_network_interface" "UEMCSPISSAS1P1" {
  count                            = var.environment == "production" ? "1" : "0"
  
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P1-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS1${upper(var.environment_acronym)}${count.index + 1}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location
  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P1-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS1${upper(var.environment_acronym)}${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPISSAS1P1" {
  count                            = var.environment == "production" ? "1" : "0"
  
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS1${upper(var.environment_acronym)}${count.index + 1}"
  location                        = azurerm_resource_group.cospivnetrg.location
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  network_interface_ids           = [azurerm_network_interface.UEMCSPISSAS1P1[count.index].id]
  vm_size                         = var.UEMCSPISSAS_vm_type

  availability_set_id             = azurerm_availability_set.aset_spissas.id
  delete_os_disk_on_termination   = "true"
  delete_data_disks_on_termination= "true"

  storage_image_reference {
    id                            = var.environment == "production" ? var.srvr_vm_image_id : ""
    publisher                     = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer                         = var.environment == "production" ? "" : "WindowsServer"
    sku                           = var.environment == "production" ? "" : "2016-Datacenter"
    version                       = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P1_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS1${upper(var.environment_acronym)}${count.index + 1}_OSDisk"
    caching                       = "ReadWrite"
    create_option                 = "FromImage"
    managed_disk_type             = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P1_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_1"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" ? "FromImage" : "Empty"
    lun                           = 0
    disk_size_gb                  = "500"
  }

  storage_data_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_2"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" ? "FromImage" : "Empty"
    lun                           = 1
    disk_size_gb                  = "256"
  }

  os_profile {
    computer_name                 = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P1" : "VMW${upper(var.application_acronym)}SSAS1${upper(var.environment_acronym)}${count.index + 1}"
    admin_username                = "ssas1admin"
    admin_password                = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent            = true
  }

  boot_diagnostics {
    enabled                       = "true"
    storage_uri                   = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                            = var.tags

  lifecycle {
    prevent_destroy               = false
  }

}

# Version 2
resource "azurerm_network_interface" "UEMCSPISSAS1P2" {
  count                            = "1"
  
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P2-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS${count.index + 1}${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location
  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P2-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS${count.index + 1}${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
  
}

resource "azurerm_virtual_machine" "UEMCSPISSAS1P2" {
  count                            = "1"
  
  name                            = var.environment== "production" ? "UEMC${upper(var.application_acronym)}SSAS1P2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS${count.index + 1}${upper(var.environment_acronym)}"
  location                        = azurerm_resource_group.cospivnetrg.location
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  network_interface_ids           = [azurerm_network_interface.UEMCSPISSAS1P2[count.index].id]
  vm_size                         = var.UEMCSPISSAS_vm_type
  availability_set_id             = azurerm_availability_set.aset_spissas.id
  delete_os_disk_on_termination   = "true"
  delete_data_disks_on_termination= "true"

  storage_image_reference {
    id                            = var.environment == "production" ? var.ssas_vm_image_id : ""
    publisher                     = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer                         = var.environment == "production" ? "" : "WindowsServer"
    sku                           = var.environment == "production" ? "" : "2016-Datacenter"
    version                       = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P2_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS${count.index + 1}${upper(var.environment_acronym)}_OSDisk"
    caching                       = "ReadWrite"
    create_option                 = "FromImage"
    managed_disk_type             = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P2_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS${count.index + 1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" ? "FromImage" : "Empty"
    lun                           = 0
    disk_size_gb                  = "500"
  }

  storage_data_disk {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P2_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SSAS${count.index + 1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type             = var.wkstn_machine_disk_type
    create_option                 = var.environment == "production" ? "FromImage" : "Empty"
    lun                           = 1
    disk_size_gb                  = "256"
  }

  os_profile {
    computer_name                 = var.environment == "production" ? "UEMC${upper(var.application_acronym)}SSAS1P2" : "VMW${upper(var.application_acronym)}SSAS${count.index + 1}${upper(var.environment_acronym)}"
    admin_username                = var.environment == "production" ? "ssas1admin" : "ssas1admin"
    admin_password                = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent            = true
  }

  boot_diagnostics {
    enabled                       = "true"
    storage_uri                   = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                            = var.tags

  lifecycle {
    prevent_destroy               = false
  }
}

