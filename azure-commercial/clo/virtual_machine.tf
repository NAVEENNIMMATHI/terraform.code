resource "azurerm_network_interface" "cloappnic" {
  count                            = var.count_value_appvm

  name                             = var.environment=="production" ? "UEMCCLOAPP1P1-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index+1}${upper(var.environment_acronym)}-nic"
  resource_group_name              = module.apprg.resource_group_name
  location                         = module.apprg.resource_group_location
  ip_configuration {
    name                           = var.environment=="production" ? "UEMCCLOAPP1P1-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index+1}${upper(var.environment_acronym)}-config"
    subnet_id                      = azurerm_subnet.clowebsbn.id
    private_ip_address_allocation  = "Dynamic"
  }

  tags                             = var.tags
}

resource "azurerm_virtual_machine" "cloappvm" {
  count                            = var.count_value_appvm

  name                             = var.environment=="production" ? "UEMCCLOAPP1P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index+1}${upper(var.environment_acronym)}"
  location                         = module.apprg.resource_group_location
  resource_group_name              = upper(module.apprg.resource_group_name)
  network_interface_ids            = [element(azurerm_network_interface.cloappnic.*.id, count.index)]
  vm_size                          = "Standard_D4s_v3"
  availability_set_id              = module.appvmas.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id                             = var.environment == "production" ? var.vm_image_id : ""
    publisher                      = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer                          = var.environment == "production" ? "" : "WindowsServer"
    sku                            = var.environment == "production" ? "" : "2016-Datacenter"
    version                        = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name                           = var.environment=="production" ? "UEMCCLOAPP1P1_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index+1}${upper(var.environment_acronym)}_OSDisk"
    caching                        = "ReadWrite"
    create_option                  = "FromImage"
    managed_disk_type              = "Standard_LRS"
  }

  storage_data_disk {
    name                           = var.environment=="production" ? "UEMCCLOAPP1P1_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index+1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type              = "Standard_LRS"
    create_option                  = "Empty"
    lun                            = 0
    disk_size_gb                   = "200"
  }

  storage_data_disk {
    name                           = var.environment=="production" ? "UEMCCLOAPP1P1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}APP${count.index+1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type              = "Standard_LRS"
    create_option                  = "Empty"
    lun                            = 1
    disk_size_gb                   = "200"
  }

  os_profile {
    computer_name                  = var.environment=="production" ? "UEMCCLOAPP1P1" : "VMW${upper(var.application_acronym)}APP${count.index+1}${upper(var.environment_acronym)}"
    admin_username                 = var.environment=="production" ? "cloapp1p1admin" : "${var.application_acronym}app${count.index+1}${var.environment_acronym}admin"
    admin_password                 = var.admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades      = false
    provision_vm_agent             = true
  }

  boot_diagnostics {
    enabled                        = "true"
    storage_uri                    = module.vmdiagnosticslogssa.primary_blob_endpoint
  }

  identity {
    type                           = "SystemAssigned"
  }

  lifecycle {
    prevent_destroy                = false
  }

  tags                             = var.tags
}

resource "azurerm_network_interface" "clobstnnic" {
  count                            = var.count_value_bstnhosts

  name                             = var.environment=="production" ? "UEMCCLOBSTN${count.index+1}P1-nic" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}BSTN${count.index+1}${upper(var.environment_acronym)}-nic"
  resource_group_name              = module.bstnhostsrg.resource_group_name
  location                         = module.bstnhostsrg.resource_group_location
  ip_configuration {
    name                           = var.environment=="production" ? "UEMCCLOBSTN${count.index+1}P1-config" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}BSTN${count.index+1}${upper(var.environment_acronym)}-config"
    subnet_id                      = azurerm_subnet.clomgmtsbn.id
    private_ip_address_allocation  = "Dynamic"
  }

  tags                             = var.tags
}


resource "azurerm_virtual_machine" "clobstnvm" {
  count                            = var.count_value_bstnhosts
  
  name                             = var.environment=="production" ? "UEMCCLOBSTN${count.index+1}P1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}BSTN${count.index+1}${upper(var.environment_acronym)}"
  location                         = module.bstnhostsrg.resource_group_location
  resource_group_name              = upper(module.bstnhostsrg.resource_group_name)
  network_interface_ids            = [element(azurerm_network_interface.clobstnnic.*.id, count.index)]
  vm_size                          = "Standard_DS2_v2"
  availability_set_id              = module.bstnhostsas.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    id                             = var.environment == "production" ? var.vm_image_id : ""
    publisher                      = var.environment == "production" ? "" : "MicrosoftWindowsServer"
    offer                          = var.environment == "production" ? "" : "WindowsServer"
    sku                            = var.environment == "production" ? "" : "2016-Datacenter"
    version                        = var.environment == "production" ? "" : "latest"
  }

  storage_os_disk {
    name                           = var.environment=="production" ? "UEMCCLOBSTN${count.index+1}P1_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}BSTN${count.index+1}${upper(var.environment_acronym)}_OSDisk"
    caching                        = "ReadWrite"
    create_option                  = "FromImage"
    managed_disk_type              = "Standard_LRS"
  }

  storage_data_disk {
    name                           = var.environment=="production" ? "UEMCCLOBSTN${count.index+1}P1_DataDisk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}BSTN${count.index+1}${upper(var.environment_acronym)}_DataDisk_1"
    managed_disk_type              = "Standard_LRS"
    create_option                  = "Empty"
    lun                            = 0
    disk_size_gb                   = "200"
  }

  storage_data_disk {
    name                           = var.environment=="production" ? "UEMCCLOBSTN${count.index+1}P1_DataDisk_2" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}BSTN${count.index+1}${upper(var.environment_acronym)}_DataDisk_2"
    managed_disk_type              = "Standard_LRS"
    create_option                  = "Empty"
    lun                            = 1
    disk_size_gb                   = "200"
  }

  os_profile {
    computer_name                  = var.environment=="production" ? "UEMCCLOBSTN${count.index+1}P1" : "VMW${upper(var.application_acronym)}BSTN${count.index+1}${upper(var.environment_acronym)}"
    admin_username                 = var.environment=="production" ? "clobstn${count.index+1}p1admin" : "${var.application_acronym}${count.index+1}bstn${var.environment_acronym}admin"
    admin_password                 = var.admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades      = false
    provision_vm_agent             = true
  }

  boot_diagnostics {
    enabled                        = "true"
    storage_uri                    = module.vmdiagnosticslogssa.primary_blob_endpoint
  }

  lifecycle {
    prevent_destroy                = false
  }

  tags                             = var.tags
}