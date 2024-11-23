resource "azurerm_container_registry" "mdpacr" {
  name                = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_name = module.mdp_rg_main.resource_group_name
  location            = module.mdp_rg_main.resource_group_location
  sku                 = "Premium"
  admin_enabled       = "true"
  public_network_access_enabled = "false"
  
  identity {
    type = "SystemAssigned"
  }
  network_rule_set {
    default_action    = "Deny"
  }

  lifecycle {
    ignore_changes = [network_rule_set, public_network_access_enabled]
  }

  tags                = var.tags
}


resource "azurerm_monitor_diagnostic_setting" "az-acr-comm-diag" {
  

  name                           = "${azurerm_container_registry.mdpacr.name}diag"
  target_resource_id             = azurerm_container_registry.mdpacr.id
  #log_analytics_workspace_id    = azurerm_log_analytics_workspace.hub.id
  log_analytics_workspace_id     = data.azurerm_log_analytics_workspace.spoke_law.id
  
  log {
    category = "ContainerRegistryRepositoryEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "ContainerRegistryLoginEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

/*

resource "null_resource" "import_container_image" {
 

  provisioner "local-exec" {
    command = "az login --service-principal --username ${var.client_id} --password ${var.client_secret} --tenant ${var.tenant_id} && az account set --subscription=${data.azurerm_subscription.current.subscription_id} && az acr import -n ${azurerm_container_registry.acr.name} --force --source quay.io/ukhomeofficedigital/clamav:latest -t clamav:latest"
  }
}
*/