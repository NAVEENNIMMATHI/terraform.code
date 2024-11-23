# Version 1
resource "azurerm_network_interface" "UEMCSPIPRODSQL1P" {
  count                            = var.environment == "production" ? "1" : "0"

  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1-nic" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1-config" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIPRODSQL1P" {
  count                            = var.environment == "production" ? "1" : "0"

  name                             = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}"  # Name does not meet standard to meet 15 character limit requirement (no OS_profile config block)
  location                         = azurerm_resource_group.cospivnetrg.location
  resource_group_name              = azurerm_resource_group.cospivnetrg.name
  network_interface_ids            = [azurerm_network_interface.UEMCSPIPRODSQL1P[count.index].id]
  vm_size                          = var.UEMCSPIPRODSQL_vm_type

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true


  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1_20181016_osdisk" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}_OSDisk"
    caching           = "ReadWrite"
    create_option     = var.environment == "production" ? "Attach" : "FromImage"
    managed_disk_type = "Premium_LRS"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1_20181016_uemcspiprodsql1p1-datadisk-000-20181023-010135" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_1"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 0
    disk_size_gb      = "3072"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1_20181016_uemcspiprodsql1p1-datadisk-001-20181023-010135" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 1
    disk_size_gb      = "500"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1_Datadisk-002-CHG31208" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_3"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 3
    disk_size_gb      = "500"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P1_Datadisk-001-CHG31208" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}${count.index + 1}_DataDisk_4"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 2
    disk_size_gb      = "6144"
  }

  boot_diagnostics {
    enabled           = "true"
    storage_uri       = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                = var.tags

  lifecycle {
    prevent_destroy   = false
  }

}

# Version 2
resource "azurerm_network_interface" "UEMCSPIPRODSQL1P2" {
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIPRODSQL1P2" {
  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}"
  location                        = azurerm_resource_group.cospivnetrg.location
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  network_interface_ids           = [azurerm_network_interface.UEMCSPIPRODSQL1P2.id]
  vm_size                         = var.UEMCSPIPRODSQL_vm_type
  availability_set_id             = azurerm_availability_set.aset_prodsql.id
  delete_os_disk_on_termination   = true
  delete_data_disks_on_termination= true

  storage_image_reference {
    id                = var.environment == "production" ? var.sql_vm_image_id : ""
    publisher         = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer             = var.environment == "production" ? "" : "WindowsServer"
    sku               = var.environment == "production" ? "" : "2016-Datacenter"
    version           = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 0
    disk_size_gb      = "3072"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 1
    disk_size_gb      = "500"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2_DataDisk_2_CHG0031415" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}_DataDisk_3"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 3
    disk_size_gb      = "500"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL1P2_DataDisk_1_CHG0031415" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}_DataDisk_4"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 2
    disk_size_gb      = "6144"
  }

  os_profile {
    computer_name     = var.environment == "production" ? "PRODSQL1P2" : "VMW${upper(var.application_acronym)}SQL1${upper(var.environment_acronym)}"
    admin_username    = var.environment == "production" ? "prodsql1admin" : "${var.environment}sql1admin"
    admin_password    = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent= true
  }

  boot_diagnostics {
    enabled           = "true"
    storage_uri       = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                = var.tags

  lifecycle {
    prevent_destroy   = false
  }
}

resource "azurerm_network_interface" "UEMCSPIPRODSQL2P2" {
  count                            = var.environment == "production" ? "1" : "0"

  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPIPRODSQL2P2" {
  count                            = var.environment == "production" ? "1" : "0"

  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}"
  location                        = azurerm_resource_group.cospivnetrg.location
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  network_interface_ids           = [azurerm_network_interface.UEMCSPIPRODSQL2P2[count.index].id]
  vm_size                         = var.prodsql2_vm_size
  availability_set_id             = azurerm_availability_set.aset_prodsql.id
  delete_os_disk_on_termination   = true
  delete_data_disks_on_termination= true

  storage_image_reference {
    id                = var.environment == "production" ? var.sql_vm_image_id : ""
    publisher         = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer             = var.environment == "production" ? "" : "WindowsServer"
    sku               = var.environment == "production" ? "" : "2016-Datacenter"
    version           = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.environment == "production" ? var.wkstn_machine_disk_type_premium : var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}_DataDisk_1"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 0
    disk_size_gb      = "3072"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "FromImage" : "Empty"
    lun               = 1
    disk_size_gb      = "500"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2_DataDisk_3" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}_DataDisk_3"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 2
    disk_size_gb      = "4096"
  }
  
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}PRODSQL2P2_DataDisk_4" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}_DataDisk_4"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 3
    disk_size_gb      = "500"
  } 

  os_profile {
    computer_name     = var.environment == "production" ? "PRODSQL2P2" : "VMW${upper(var.application_acronym)}SQL2${upper(var.environment_acronym)}${count.index + 2}"
    admin_username    = var.environment == "production" ? "prodsql2admin" : "${var.environment}sql2admin"
    admin_password    = var.SPIvmpassword
  }

  os_profile_windows_config {
    provision_vm_agent= true
  }

  boot_diagnostics {
    enabled           = "false"
    storage_uri       = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                = var.tags

  lifecycle {
    prevent_destroy   = false
  }
}

# Staging SQL VM
resource "azurerm_network_interface" "UEMCSPISTGSQ1P1" {
  name                            = var.environment == "production" ? "uemc${lower(var.application_acronym)}stgsq1p1541" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}-nic"
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  location                        = azurerm_resource_group.cospivnetrg.location

  ip_configuration {
    name                          = var.environment == "production" ? "ipconfig1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}-config"
    subnet_id                     = azurerm_subnet.spidb1_subnet.id
    private_ip_address_allocation = "dynamic"
  }

  tags                            = var.tags
}

resource "azurerm_virtual_machine" "UEMCSPISTGSQ1P1" {
  count                           = var.environment == "production" ? "1" : "1"

  name                            = var.environment == "production" ? "UEMC${upper(var.application_acronym)}STGSQ1P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}"
  location                        = azurerm_resource_group.cospivnetrg.location
  resource_group_name             = azurerm_resource_group.cospivnetrg.name
  network_interface_ids           = [azurerm_network_interface.UEMCSPISTGSQ1P1.id]
  vm_size                         = var.prodsql2_vm_size
  delete_os_disk_on_termination   = true
  delete_data_disks_on_termination= true

  dynamic "storage_image_reference" {
    for_each = var.environment == "production" ? [] : [{}]
    content {
      publisher         = "MicrosoftWindowsServer"
      offer             = "WindowsServer"
      sku               = "2016-Datacenter"
      version           = "latest"
    }
  }

  dynamic "os_profile" {
    for_each = var.environment == "production" ? [] : [{}]
    content {
      computer_name     = var.environment == "production" ? "UEMC${upper(var.application_acronym)}STGSQ1P1" : "VMW${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}"
      admin_username    = var.environment == "production" ? "prodsql2admin" : "${var.environment_acronym}stgsqladmin"
      admin_password    = var.SPIvmpassword
    }  
  }

  dynamic "os_profile_windows_config" {
    for_each = var.environment == "production" ? [] : [{}]

    content {
      provision_vm_agent = true
    }
  }

  storage_os_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}STAGINGSQL1P1_OSDisk_New" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}_OSDisk"
    caching           = "ReadWrite"
    create_option     = var.environment == "production" ? "Attach" : "FromImage"
    managed_disk_type = var.wkstn_machine_disk_type
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}STAGINGSQL1P1_DataDisk_1_New" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 0
    disk_size_gb      = "2048"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}STGSQL1P1_DataDisk_2_New" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type = var.wkstn_machine_disk_type
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 1
    disk_size_gb      = "500"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}STAGINGSQL1P1_DataDisk_2_New" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}_DataDisk_3"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 2
    disk_size_gb      = "10240"
  }
  storage_data_disk {
    name              = var.environment == "production" ? "UEMC${upper(var.application_acronym)}STAGINGSQL1P1_DataDisk_3" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}STGSQL${upper(var.environment_acronym)}_DataDisk_4"
    managed_disk_type = "Premium_LRS"
    create_option     = var.environment == "production" ? "Attach" : "Empty"
    lun               = 3
    disk_size_gb      = "10240"
  }
  boot_diagnostics {
    enabled           = "true"
    storage_uri       = azurerm_storage_account.copeuscospivmlog01sa.primary_blob_endpoint
  }

  tags                = var.tags

  lifecycle {
    prevent_destroy   = false
  }
}

