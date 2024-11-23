resource "azurerm_network_interface" "fastpathbuildvm_nic" {
  name                             = "nic-${var.location_acronym}-${var.application_name}-buildvm-${var.environment_acronym}-${count.index+1}"
  resource_group_name              = module.apprg.resource_group_name
  location                         = module.apprg.resource_group_location
  count                            = var.vm_count
  tags                             = var.tags
  ip_configuration {
    name                           = "nic-${var.location_acronym}-${var.application_name}-buildvm-${var.environment_acronym}-${count.index+1}-config"
    subnet_id                      = module.appsubnet.subnet_id
    private_ip_address_allocation  = "dynamic"
  }
}

resource "azurerm_virtual_machine" "fastpathbuildvm" {
  name                             = "${var.vm_os_type}${upper(var.location_acronym)}${upper(var.application_acronym)}${var.vm_workload_desc}${count.index+1}${upper(var.environment_acronym)}"
  location                         = module.apprg.resource_group_location
  resource_group_name              = module.apprg.resource_group_name
  network_interface_ids            = ["${element(azurerm_network_interface.fastpathbuildvm_nic.*.id, count.index)}"]
  vm_size                          = var.vm_size
  availability_set_id              = module.availabilityset.availability_set_id
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  license_type                     = "Windows_Server"
  count                            = var.vm_count
  tags                             = var.tags

  lifecycle {
    prevent_destroy                = false
  }

  storage_image_reference {
  publisher              = "MicrosoftWindowsServer"
  offer                  = "WindowsServer"
  sku                    = "2016-Datacenter"
  version                = "latest"
  }

  storage_os_disk {
  name                   = "${var.vm_os_type}${upper(var.location_acronym)}${upper(var.application_acronym)}${var.vm_workload_desc}${count.index+1}${upper(var.environment_acronym)}_OS_Disk"
  caching                = "ReadWrite"
  create_option          = "FromImage"
  managed_disk_type      = "Standard_LRS"
  }

  storage_data_disk {
  name                   = "${var.vm_os_type}${upper(var.location_acronym)}${upper(var.application_acronym)}${var.vm_workload_desc}${count.index+1}${upper(var.environment_acronym)}_DataDisk"
  managed_disk_type      = "Standard_LRS"
  create_option          = "Empty"
  lun                    = 0
  disk_size_gb           = var.data_disk_size
  }

  storage_data_disk {
  name                   = "${var.vm_os_type}${upper(var.location_acronym)}${upper(var.application_acronym)}${var.vm_workload_desc}${count.index+1}${upper(var.environment_acronym)}_DataDisk2"
  managed_disk_type      = "Standard_LRS"
  create_option          = "Empty"
  lun                    = 1
  disk_size_gb           = var.data_disk_size
  }

  os_profile {
  computer_name          = "${var.vm_os_type}${upper(var.location_acronym)}${upper(var.application_acronym)}${var.vm_workload_desc}${count.index+1}${upper(var.environment_acronym)}"
  admin_username         = "${var.vm_os_type}${upper(var.location_acronym)}${upper(var.application_acronym)}${var.vm_workload_desc}${count.index+1}${upper(var.environment_acronym)}ADMIN"
  admin_password         = var.vm_admin_password
  }

  os_profile_windows_config {
    provision_vm_agent   = true
  }

  boot_diagnostics {
    enabled              = "true"
    storage_uri          = data.azurerm_storage_account.vmdiagnosticslogs.primary_blob_endpoint
  }

  identity {
    type  =  "SystemAssigned"
  }

}

 resource "azurerm_virtual_machine_extension" "custom_ext_win_vm" {
  name                       = "CustomScriptExtension"
  virtual_machine_id         = element(azurerm_virtual_machine.fastpathbuildvm.*.id, count.index)
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.9"
  auto_upgrade_minor_version = false
  count                      = var.vm_count
  tags                       = var.tags
  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.ps1.rendered)}')) | Out-File -filepath win_initialise_data_disk.ps1\" && powershell -ExecutionPolicy Unrestricted -File win_initialise_data_disk.ps1"
    }
SETTINGS
  }

resource "azurerm_virtual_machine_extension" "oms_ext_win_vm" {
  name                 = "OMSextension"
  virtual_machine_id   = element(azurerm_virtual_machine.fastpathbuildvm.*.id, count.index)
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0"
  count                = var.vm_count

settings = <<SETTINGS
    {
        "workspaceId": "${data.azurerm_log_analytics_workspace.law.workspace_id}"

    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "workspaceKey": "${data.azurerm_log_analytics_workspace.law.primary_shared_key}"
    }
   PROTECTED_SETTINGS
 tags                = var.tags
}

resource "null_resource" "AzureDiskEncryption_ext_win_vm" {
count = var.vm_count
  provisioner "local-exec" {
     command = "az login --service-principal --username ${data.azuread_service_principal.fastpathsp.application_id} --password ${var.encryptappsp_key_password} --tenant ${var.tenant_id}"
  }
  provisioner "local-exec" {
     command = "az vm encryption enable --name ${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)} --resource-group ${module.apprg.resource_group_name} --aad-client-id ${data.azuread_service_principal.fastpathsp.application_id} --aad-client-secret ${var.encryptappsp_key_password}  --disk-encryption-keyvault ${data.azurerm_key_vault.keyvault.id} --subscription ${data.azurerm_subscription.subscription_id.subscription_id} --volume-type all"
  }
  
}

resource "azurerm_backup_protected_vm"  "backup_cmawstsvm" {
  source_vm_id               = element(azurerm_virtual_machine.fastpathbuildvm.*.id, count.index)
  recovery_vault_name        = module.recoveryservice.services_vault_name
  backup_policy_id           = module.recoveryservice.backup_policy_id
  resource_group_name        = module.backuprecoveryrg.resource_group_name
  count                      = var.vm_count
}

##New Alert Metric##
 resource "azurerm_virtual_machine_extension" "IaaSDiagnostics_logs_ext_win_vm" {
   name                 = "IaaSDiagnostics"
   virtual_machine_id   = element(azurerm_virtual_machine.fastpathbuildvm.*.id, count.index)
   publisher            = "Microsoft.Azure.Diagnostics"
   type                 = "IaaSDiagnostics"
   type_handler_version = "1.5"
   count                = var.vm_count
   tags                 = var.tags
   settings = <<SETTINGS
     {
         "xmlCfg": "${base64encode(data.template_file.xml.rendered)}",
         "storageAccount": "${var.diagnostic_storage_account_name}"
     }
 SETTINGS
   protected_settings = <<SETTINGS
     {
       "storageAccountName":"${var.diagnostic_storage_account_name}",
       "storageAccountKey":"${data.azurerm_storage_account.vmdiagnosticslogs.primary_access_key}"
     }
 SETTINGS
 }

 resource "azurerm_virtual_machine_extension" "IaaSAntimalware_ext_win_vm" {
   name                 = "IaaSAntimalware"
   virtual_machine_id   = element(azurerm_virtual_machine.fastpathbuildvm.*.id, count.index)
   publisher            = "Microsoft.Azure.Security"
   type                 = "IaaSAntimalware"
   type_handler_version = "1.5"
   count                = var.vm_count
   tags                 = var.tags
   settings = <<SETTINGS
     {
       "AntimalwareEnabled"        : true,
       "RealtimeProtectionEnabled" : "true",
       "ScheduledScanSettings": {
       "isEnabled"   : "true",
       "day"         : "1",
       "time"        : "120",
       "scanType"    : "Quick"
      },

       "Exclusions" : {
         "Extensions"  : "",
         "Paths"       : "",
         "Processes"   : ""
       }
     }
 SETTINGS
 }

 data "azurerm_subscription" "subscription_id" {}

 resource "azurerm_monitor_metric_alert" "os-per-disk-write-win-vm" {
   name                  = "os-per-disk-write-win_${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}"
   scopes                = ["${data.azurerm_subscription.subscription_id.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}" ]
   resource_group_name   = module.apprg.resource_group_name
   count                 = var.vm_count
   description 		      = "Total IOPS done while writing to a single disk during monitoring period for OS disk."

   criteria {
     metric_namespace    = "Microsoft.Compute/virtualMachines"
     metric_name 		    = "OS Per Disk Write Operations/Sec"
     operator 		        = "GreaterThan"
     threshold 		      = 400000
     aggregation 		    = "Total"
   }

   action {
     action_group_id     = azurerm_monitor_action_group.action_group_alert.id
   }
 }

 resource "azurerm_monitor_metric_alert" "network-in-win-vm" {
   name                  = "network-in-win_${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}"
   scopes                = ["${data.azurerm_subscription.subscription_id.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}"]
   resource_group_name   = module.apprg.resource_group_name
   count                 = var.vm_count
   description 		      = "An alert rule to watch excess network traffic coming in to VM"
  
   criteria {
     metric_namespace    = "Microsoft.Compute/virtualMachines"
     metric_name         = "Network In"
     operator 		        = "GreaterThan"
     threshold 		      = 50737418240
     aggregation 		    = "Total"
 }

   action {
     action_group_id = azurerm_monitor_action_group.action_group_alert.id
   }
 }

 resource "azurerm_monitor_metric_alert" "cpualertrule-win-vm" {
   name     		           = "cpualertrule-win_${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}"
   resource_group_name     = module.apprg.resource_group_name
   scopes                  = ["${data.azurerm_subscription.subscription_id.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}"]
   count                   = var.vm_count
   description             = "An alert rule to watch the metric Percentage CPU."
   tags                    = var.tags
   
   criteria {
     metric_namespace      = "Microsoft.Compute/virtualMachines"
     metric_name           = "Percentage CPU"
     aggregation           = "Average"
     operator              = "GreaterThan"
     threshold             = 75
   }

   action {
     action_group_id       = azurerm_monitor_action_group.action_group_alert.id
   }
 }

 resource "azurerm_monitor_metric_alert" "cpu-credits-consumed-win-vm" {
   name                = "cpu-credits-consumed-win_${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}"
   scopes              = ["${data.azurerm_subscription.subscription_id.id}/resourceGroups/${module.apprg.resource_group_name}/providers/Microsoft.Compute/virtualMachines/${element(azurerm_virtual_machine.fastpathbuildvm.*.name, count.index)}" ]
   resource_group_name = module.apprg.resource_group_name
   count               = var.vm_count
   description 		    = "CPU credits consumed by VM during monitoring period."
   tags                = var.tags

   criteria {
     metric_namespace  = "Microsoft.Compute/virtualMachines"
     metric_name 		  = "CPU Credits Consumed"
     operator 		      = "GreaterThan"
     threshold 	      = 400000
     aggregation 		  = "Average"
   }
  
   action {
     action_group_id   = azurerm_monitor_action_group.action_group_alert.id
   }
 }

 resource "azurerm_role_assignment" "VMToRG" {
  count                = length(azurerm_virtual_machine.fastpathbuildvm)
  scope                = module.apprg.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_virtual_machine.fastpathbuildvm[count.index].identity.0.principal_id
}