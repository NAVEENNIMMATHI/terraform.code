resource "azurerm_network_interface" "rstudio_workstnvm_nic" {
  name                = var.environment == "production" ? "UEMCRSWKSTN1P1-nic" : lower("nic-${var.location_acronym}-${var.application_acronym}-${var.rstudio_workstnvm_name_prefix1}-${var.environment_acronym}")
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  #count               = var.rstudio_workstnvm_count

  ip_configuration {
    name                          = var.environment == "production" ? "UEMCRSWKSTN1P1-config" : upper("VMW${var.location_acronym}${var.application_acronym}${var.rstudio_workstnvm_name_prefix1}${var.environment_acronym}-config")
    subnet_id                     = module.windows_subnet.subnet_id
    private_ip_address_allocation = "dynamic"
  }
  tags = var.tags
  }

resource "azurerm_virtual_machine" "rstudiowrkstnvminstance" {
  depends_on            = [azurerm_network_interface.rstudio_workstnvm_nic]
  name                  = var.environment == "production" ? "UEMCRSWKSTN1P1" : (var.environment == "uat" ? upper("VMW${var.location_acronym}${var.application_acronym}${var.rstudio_workstnvm_name_prefix1}UA") : upper("VMW${var.location_acronym}${var.application_acronym}${var.rstudio_workstnvm_name_prefix1}${var.environment_acronym}"))
  location              = module.applicationrg.resource_group_location
  resource_group_name   = module.applicationrg.resource_group_name
  network_interface_ids = [azurerm_network_interface.rstudio_workstnvm_nic.id]
  vm_size               = var.rstudio_workstnvm_size
  #count                 = var.rstudio_workstnvm_count
  # availability_set_id   = module.availabilityset.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  tags                             = var.tags

  lifecycle {
    prevent_destroy = false
      ignore_changes = [
      delete_os_disk_on_termination,
      delete_data_disks_on_termination
      ]
  }

  storage_image_reference {
    id        = var.target_deployment_environment == "prod" ? var.vm_windows_image_id : ""
    publisher = var.target_deployment_environment == "prod" ? "" : "MicrosoftWindowsServer"
    offer     = var.target_deployment_environment == "prod" ? "" : "WindowsServer"
    sku       = var.target_deployment_environment == "prod" ? "" : "2016-Datacenter"
    version   = var.target_deployment_environment == "prod" ? "" : "latest"
  }

  storage_os_disk {    
    name              = var.environment == "production" ? "UEMCRSWKSTN1P1_OSDisk" : (var.environment == "uat" ? "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${upper(var.rstudio_workstnvm_name_prefix1)}UA_OSDisk" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${upper(var.rstudio_workstnvm_name_prefix1)}${upper(var.environment_acronym)}_OSDisk")
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_data_disk {
    name              = var.environment == "production" ? "UEMCRSWKSTN1P1_DataDisk_1" : (var.environment == "uat" ? "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${upper(var.rstudio_workstnvm_name_prefix1)}UA_Data_Disk_1" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${upper(var.rstudio_workstnvm_name_prefix1)}${upper(var.environment_acronym)}_Data_Disk_1")
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "128"
  }

  os_profile {
    computer_name  = var.environment == "production" ? "UEMCRSWKSTN1P1" : (var.environment == "uat" ? "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${upper(var.rstudio_workstnvm_name_prefix1)}UA" : "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}${upper(var.rstudio_workstnvm_name_prefix1)}${upper(var.environment_acronym)}")
    admin_username = var.rstudio_workstnvm_adminname
    admin_password = var.rstudio_workstnvm_admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
      winrm {
        protocol        = "https"
        certificate_url = azurerm_key_vault_certificate.rstudio_workstnvm_cert.secret_id
      }
  }

  os_profile_secrets {
    source_vault_id = azurerm_key_vault.rstudio_key_vault_local.id
      vault_certificates {
        certificate_url   = azurerm_key_vault_certificate.rstudio_workstnvm_cert.secret_id
        certificate_store = "My"
      }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = var.environment == "production" ? "https://coprstudiovmlog01sa.blob.core.windows.net/" : module.vmdiagnosticslogs.primary_blob_endpoint
  }
}
############################################################
      ### NEW PRD WRKSTN VM - ONLY IN PRODUCTION ###
############################################################

resource "azurerm_network_interface" "rstudio_workstnvm_nic2" {
  name                = lower("nic-${var.location_acronym}-${var.application_acronym}-WK2-${var.environment_acronym}")
  resource_group_name = module.applicationrg.resource_group_name
  location            = module.applicationrg.resource_group_location
  count               = var.environment == "production" ? 1 : 0

  ip_configuration {
    name                          = upper("VMW${var.location_acronym}${var.application_acronym}WK2${var.environment_acronym}-config")
    subnet_id                     = module.windows_subnet.subnet_id
    private_ip_address_allocation = "dynamic"
  }
  tags = var.tags
  }

resource "azurerm_virtual_machine" "rstudiowrkstnvminstance2" {
  depends_on            = [azurerm_network_interface.rstudio_workstnvm_nic2]
  name                  = upper("VMW${var.location_acronym}RSTUWK2${var.environment_acronym}")
  location              = module.applicationrg.resource_group_location
  resource_group_name   = module.applicationrg.resource_group_name
  network_interface_ids = [azurerm_network_interface.rstudio_workstnvm_nic2[0].id]
  vm_size               = var.rstudio_workstnvm_size
  count                 = var.environment == "production" ? 1 : 0  
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  tags                             = var.tags

  lifecycle {
    prevent_destroy = false
      ignore_changes = [
      delete_os_disk_on_termination,
      delete_data_disks_on_termination
      ]
  }

  storage_image_reference {
    id        = var.target_deployment_environment == "prod" ? var.vm_windows_image_id : ""
    publisher = var.target_deployment_environment == "prod" ? "" : "MicrosoftWindowsServer"
    offer     = var.target_deployment_environment == "prod" ? "" : "WindowsServer"
    sku       = var.target_deployment_environment == "prod" ? "" : "2016-Datacenter"
    version   = var.target_deployment_environment == "prod" ? "" : "latest"
  }

  storage_os_disk {
    name              = "${upper("VMW${var.location_acronym}${var.application_acronym}WK2${var.environment_acronym}")}_OSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_data_disk {
    name              = "${upper("VMW${var.location_acronym}${var.application_acronym}WK2${var.environment_acronym}")}_Data_Disk_1"
    managed_disk_type = "Premium_LRS"
    create_option     = "Empty"
    lun               = 0
    disk_size_gb      = "128"
  }

  os_profile {
    computer_name  = "${upper("VMW${var.location_acronym}RSTUWK2${var.environment_acronym}")}"
    admin_username = var.rstudio_workstnvm_adminname
    admin_password = var.rstudio_workstnvm_admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
      winrm {
        protocol        = "https"
        certificate_url = azurerm_key_vault_certificate.rstudio_workstnvm_cert.secret_id
      }
  }

  os_profile_secrets {
    source_vault_id = azurerm_key_vault.rstudio_key_vault_local.id
      vault_certificates {
        certificate_url   = azurerm_key_vault_certificate.rstudio_workstnvm_cert.secret_id
        certificate_store = "My"
      }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "https://coprstudiovmlog01sa.blob.core.windows.net/"
  }
}


