resource "azurerm_network_interface" "UEMCALTERYX1P1" {
        name                      = "${var.UEMCALTERYX1P1_name}-nic"
        resource_group_name       = module.applicationrg.resource_group_name
        location                  = module.applicationrg.resource_group_location
        ip_configuration {
                name                          = "${var.UEMCALTERYX1P1_name}-config"
                subnet_id                     = module.subnet.subnet_id
                private_ip_address_allocation = "dynamic"
        }
        tags = var.tags
  }
resource "azurerm_virtual_machine" "UEMCALTERYX1P1" {
        name                  = var.UEMCALTERYX1P1_name
        location              = module.applicationrg.resource_group_location
        resource_group_name   = module.applicationrg.resource_group_name
        network_interface_ids = [azurerm_network_interface.UEMCALTERYX1P1.id]
        vm_size               = var.UEMCALTERYX1P1_vm_size
        availability_set_id   = module.availabilityset.availability_set_id
        delete_os_disk_on_termination = true
        delete_data_disks_on_termination = true
        license_type          = "Windows_Server"
        tags = var.tags

        lifecycle {
              prevent_destroy = false
        }

        storage_image_reference {
              id                         = var.deployment_environment == "p" ? var.wkstn_vm_image_id : ""
              publisher                  = var.deployment_environment == "p" ? "" : "MicrosoftWindowsServer"
              offer                      = var.deployment_environment == "p" ? "" : "WindowsServer"
              sku                        = var.deployment_environment == "p" ? "" : "2016-Datacenter"
              version                    = var.deployment_environment == "p" ? "" : "latest"
            }


        storage_os_disk {
                name              = "${var.UEMCALTERYX1P1_name}_OSDisk"
                caching           = "ReadWrite"
                create_option     = "FromImage"
                managed_disk_type = "Standard_LRS"
        }
        storage_data_disk {
                name              = "${var.UEMCALTERYX1P1_name}_DataDisk_1"
                managed_disk_type = "Standard_LRS"
                create_option     = var.deployment_environment == "p" ? "Empty" : "Empty"
                lun               = 0
                disk_size_gb      = "512"
        }

        storage_data_disk {
                name              = "${var.UEMCALTERYX1P1_name}_DataDisk_2"
                managed_disk_type = "Standard_LRS"
                create_option     = var.deployment_environment == "p" ? "Empty" : "Empty"
                lun               = 1
                disk_size_gb      = "512"
        }

        os_profile {
                computer_name  = var.deployment_environment == "p" ? var.UEMCALTERYX1P1_name : var.os_name
                admin_username =  var.deployment_environment == "p" ? "alteryx1p1admin" : "alteryx1${lower(var.environment_acronym)}admin"
                admin_password = var.vmpassword
        }

        os_profile_windows_config {
                provision_vm_agent = true
         }

        boot_diagnostics {
                enabled     = "true"
                storage_uri = data.terraform_remote_state.spi.outputs.vm_storage_uri
        }

}