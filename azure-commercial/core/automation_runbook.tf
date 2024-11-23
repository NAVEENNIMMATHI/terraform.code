resource "azurerm_automation_runbook" "stop-vm" {
  name                    = "StopVM"
  location                = "eastus2"
  resource_group_name     = azurerm_automation_account.ama-use-dsc.resource_group_name
  automation_account_name = azurerm_automation_account.ama-use-dsc.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This Runbook Deallocates VM's if it is triggered by a resource health alert and the VM is in a powered off state"
  runbook_type            = "PowerShell"
  content                 = data.local_file.stop-vm.content
  tags                    = var.tags
}

resource "azurerm_automation_runbook" "remove-instance" {
  name                    = "RemoveInstance"
  location                = "eastus2"
  resource_group_name     = azurerm_automation_account.ama-use-dsc.resource_group_name
  automation_account_name = azurerm_automation_account.ama-use-dsc.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This Runbook Removes a Scale Instance when triggered by a devops pipeline task"
  runbook_type            = "PowerShell"
  content                 = data.local_file.remove-instance.content
  tags                    = var.tags
}