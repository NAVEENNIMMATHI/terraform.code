locals {
  tableau_server_vm_name          = "VMW${upper(var.location_acronym)}${upper(var.application_acronym)}SRV1${upper(var.environment_acronym)}"
}

resource "azurerm_network_interface" "tableau_server_nic" {
        name                      = var.environment == "production" ? "uemcspisrvr3p1821" : "${local.tableau_server_vm_name}-nic"
        resource_group_name       = module.applicationrg.resource_group_name
        location                  = module.applicationrg.resource_group_location
        ip_configuration {
                name                          = "ipconfig1"
                subnet_id                     = module.tabext_subnet.subnet_id
                private_ip_address_allocation = "dynamic"
        }       
        tags                      = var.tags
}

resource "azurerm_virtual_machine" "tableau_server" {
        name                      = var.environment == "production" ? "UEMCSPISRVR3P1" : local.tableau_server_vm_name        
        resource_group_name       = upper(module.applicationrg.resource_group_name)
        location                  = module.applicationrg.resource_group_location
        network_interface_ids     = [azurerm_network_interface.tableau_server_nic.id]
        vm_size                   = var.tableau_server_vm_size
        availability_set_id       = module.tableau_server_as.availability_set_id

        tags                      = var.tags
                
        delete_data_disks_on_termination = true
        delete_os_disk_on_termination    = true

        storage_image_reference {
              id                         = var.environment == "production" ? var.tableau_server_vm_image_id : ""
              publisher                  = var.environment == "production" ? "" : "MicrosoftWindowsServer"
              offer                      = var.environment == "production" ? "" : "WindowsServer"
              sku                        = var.environment == "production" ? "" : "2016-Datacenter"
              version                    = var.environment == "production" ? "" : "latest"
        }

        os_profile {
               computer_name  = var.environment == "production" ? "UEMCSPISRVR3P1" : local.tableau_server_vm_name
               admin_username = "kpmgadmin"
               admin_password = var.environment == "production" ? "" : var.vmpassword
        }

        storage_os_disk {
                name              = var.environment == "production" ? "UEMCSPISRVR3P1_disk1_c05ed85ad2c44708a6514fad7ae6b76f" : "${local.tableau_server_vm_name}_OSDisk"
                caching           = "None"
                create_option     = "FromImage"
                managed_disk_type = "Premium_LRS"
                disk_size_gb      = "300"
        }

        storage_data_disk {
                name              = var.environment == "production" ? "UEMCSPISRVR3P1_DataDisk_0" : "${local.tableau_server_vm_name}_DataDisk_1"
                managed_disk_type = "Premium_LRS"
                create_option     = var.environment == "production" ? "Attach" : "Empty"
                lun               = 0
                disk_size_gb      = "500"
        }

        storage_data_disk {
                name              = var.environment == "production" ? "UEMCSPISRVR3P1_DataDisk_1" : "${local.tableau_server_vm_name}_DataDisk_2"
                managed_disk_type = "Premium_LRS"
                create_option     = var.environment == "production" ? "Attach" : "Empty"
                lun               = 1
                disk_size_gb      = "500"
        }

        os_profile_windows_config {
                provision_vm_agent        = true
                enable_automatic_upgrades = true
        }

        boot_diagnostics {
                enabled     = "true"
                storage_uri = var.environment == "production" ? "https://eastuscospivnetrgdiag.blob.core.windows.net/" : data.terraform_remote_state.spi.outputs.vm_storage_uri
        }

}