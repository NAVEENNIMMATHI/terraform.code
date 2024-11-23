#Availability Set for ARCGIS VM
module "aset_arcgis" {
  source                       = "../../modules/availability_set"
  availability_set_name        = "avs-${lower(var.location_acronym)}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name          = module.geospatial_rg.resource_group_name
  resource_group_location      = module.geospatial_rg.resource_group_location
  platform_fault_domain_count  = "2"
  
  tags                         = var.tags
}

data "template_file" "ps1" {
  template = "${file("win_initialise_data_disk.ps1")}"
}

#ARCGIS Linux VM (File Share)
resource "azurerm_network_interface" "arcgis_nic" {
  name                          = lower("nic-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}")
  resource_group_name           = module.geospatial_rg.resource_group_name
  location                      = module.geospatial_rg.resource_group_location
  enable_accelerated_networking = true

  ip_configuration {
    name                          = upper("VML${var.location_acronym}${var.application_acronym}FS${var.environment_acronym}-config")
    subnet_id                     = module.geospatial_vm_subnet.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "arcgisvminstance" {
  availability_set_id   = module.aset_arcgis.availability_set_id
  name                  = upper("VML${var.location_acronym}${var.application_acronym}FS${var.environment_acronym}")
  location              = module.geospatial_rg.resource_group_location
  resource_group_name   = module.geospatial_rg.resource_group_name
  network_interface_ids = [azurerm_network_interface.arcgis_nic.id]
  size                  = var.vm_size_build

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "${upper("VML${var.location_acronym}${var.application_acronym}FS${var.environment_acronym}")}_osDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 256
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.2"
    version   = "latest"
  }

  admin_username = "azureuser"
  admin_password = var.arcgis_vm_admin_password
  computer_name  = upper("VML${var.location_acronym}${var.application_acronym}FS${var.environment_acronym}")

  disable_password_authentication = false

  boot_diagnostics {
    storage_account_uri = ""
  }

  tags = var.tags
}

resource "azurerm_managed_disk" "managed_disk_arcgisvminstance_data_1" {
  name                 = "${upper("VML${var.location_acronym}${var.application_acronym}FS${var.environment_acronym}")}_DataDisk_1"
  location             = module.geospatial_rg.resource_group_location
  resource_group_name  = module.geospatial_rg.resource_group_name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = 128
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "managed_disk_arcgisvminstance_data_1" {
  managed_disk_id    = azurerm_managed_disk.managed_disk_arcgisvminstance_data_1.id
  virtual_machine_id = azurerm_linux_virtual_machine.arcgisvminstance.id
  lun                = 0
  caching            = "ReadWrite"
}


#ARCGIS Vm Creation
module "build_vm_arcgis" {
  source                     = "../../azure-commercial/geospatial/arcgis_windowsvm"
  vm_region                  = "EUS"
  project_name               = "ARC"
  application_acronym        = ""
  os_type_letter             = ""
  vm_workload_desc           = "GIS"
  vm_environment             = "${upper(var.environment_acronym)}"
  resource_group_location    = module.geospatial_rg.resource_group_location
  resource_group_name        = module.geospatial_rg.resource_group_name
  tags                       = var.tags
  subnet_id                  = module.geospatial_vm_subnet.subnet_id
  count_value                = var.vm_count_buildvm_ts  /* if this value is zero VM will not create */
  vm_size                    = var.vm_size_build
  availability_set_id        = module.aset_arcgis.availability_set_id
  azurerm_image_id           = ""
  publisher                  = "MicrosoftWindowsServer"
  offer                      = "WindowsServer"
  sku                        = var.client_vm_sku
  storage_uri                = ""
  data_disk_size             = var.data_disk_size_arcgis
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = ""
  loganalytics_workspace_id  = ""
  loganalytics_workspace_key = ""
  storage_account_name       = module.vmdiagnosticslogs.storage_account_name
  storage_account_key        = module.vmdiagnosticslogs.primary_access_key
  client_id                  = ""
  diskencryption_keyvault    = ""
  backup_resource_group_name = ""
  recovery_vault_name        = ""
  backup_policy_id           = ""
  ou_path                    = ""
  domain_user_name           = ""
  domain_user_password       = ""
  admin_username             = lower("VM${var.application_acronym}${var.environment_acronym}ADMIN")
  admin_password             = var.arcgis_vm_admin_password
  encryptappsp_key_password  = ""
   
#Add a OS disk block for different managed_disk_type other than Standard_LRS 
   os_disk_override = {
      create_option = "FromImage"
      managed_disk_type = var.managed_disk_type
  }

#Add data disk blocks required for the Virtual machine. Only the added blocks for data disks will be created
   data_disk_1_override = {
      create_option = "Empty"
      managed_disk_type = "Premium_LRS"
      disk_size_gb = 512
  }
   data_disk_2_override = {
      create_option = "Empty"
      managed_disk_type = "Premium_LRS"
      disk_size_gb = 512
  }
}

#ARCGIS Management Vm Creation
module "mgmt_vm_arcgis" {
  source                     = "../../azure-commercial/geospatial/arcgis_windowsvm"
  vm_region                  = "EUS"
  project_name               = "ARC"
  application_acronym        = ""
  os_type_letter             = ""
  vm_workload_desc           = "MGMT"
  vm_environment             = var.environment_acronym == "uat" ? "UT" : upper(var.environment_acronym)
  resource_group_location    = module.geospatial_rg.resource_group_location
  resource_group_name        = module.geospatial_rg.resource_group_name
  tags                       = var.tags
  subnet_id                  = module.geospatial_mgmt_subnet.subnet_id
  count_value                = var.vm_count_buildvm_ts  /* if this value is zero VM will not create */
  vm_size                    = var.vm_size_build
  availability_set_id        = module.aset_arcgis.availability_set_id
  azurerm_image_id           = ""
  publisher                  = "MicrosoftWindowsServer"
  offer                      = "WindowsServer"
  sku                        = var.client_vm_sku
  storage_uri                = ""
  data_disk_size             = var.data_disk_size_arcgis
  template_file              = data.template_file.ps1.rendered
  template_file_xml          = ""
  loganalytics_workspace_id  = ""
  loganalytics_workspace_key = ""
  storage_account_name       = module.vmdiagnosticslogs.storage_account_name
  storage_account_key        = module.vmdiagnosticslogs.primary_access_key
  client_id                  = ""
  diskencryption_keyvault    = ""
  backup_resource_group_name = ""
  recovery_vault_name        = ""
  backup_policy_id           = ""
  ou_path                    = ""
  domain_user_name           = ""
  domain_user_password       = ""
  admin_username             = lower("VM${var.application_acronym}${var.environment_acronym}ADMIN")
  admin_password             = var.arcgis_vm_admin_password
  encryptappsp_key_password  = ""
   
#Add a OS disk block for different managed_disk_type other than Standard_LRS 
   os_disk_override = {
      create_option = "FromImage"
      managed_disk_type = var.managed_disk_type
  }

#Add data disk blocks required for the Virtual machine. Only the added blocks for data disks will be created
   data_disk_1_override = {
      create_option = "Empty"
      managed_disk_type = "Premium_LRS"
      disk_size_gb = 512
  }
   /*
   data_disk_2_override = {
      create_option = "Empty"
      managed_disk_type = "Premium_LRS"
      disk_size_gb = 512
  }
  */
}
