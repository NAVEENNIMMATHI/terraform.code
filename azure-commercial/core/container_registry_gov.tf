resource "azurerm_resource_group" "container_gov_rg" {
  count = var.environment_acronym == "dv" ? 1 : 0

  name     = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "container_gov_rg" : "RGP-${upper(var.location_acronym)}-CONTAINERGOV-${upper(var.environment_acronym)}"
  location = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "East US" : "eastus"

  tags = var.tags
}

resource "azurerm_container_registry" "container_registry" {
  count = var.environment_acronym == "dv" ? 1 : 0

  name                = "acrgov"
  resource_group_name = azurerm_resource_group.container_gov_rg[0].name
  location            = azurerm_resource_group.container_gov_rg[0].location
  sku                 = "Premium"
  admin_enabled       = false
  /*
  Geographic replication not working as expected in Gov Cloud
  georeplication_locations = ["West US"]
 */
  network_rule_set {
    default_action = "Deny"
    ip_rule {
      action   = "Allow"
      ip_range = "${module.fw_pip_1.public_ip_address}/32"
    }
    ip_rule {
      action   = "Allow"
      ip_range = "${module.fw_pip_2.public_ip_address}/32"
    }
    ip_rule {
      action   = "Allow"
      ip_range = "${module.fw_pip_3.public_ip_address}/32"
    }
    ip_rule {
      action   = "Allow"
      ip_range = "${module.fw_pip_4.public_ip_address}/32"
    }
    ip_rule {
      action   = "Allow"
      ip_range = "${module.fw_pip_5.public_ip_address}/32"
    }
    ip_rule {
      action   = "Allow"
      ip_range = var.gov_build_agent_ip
    }

  }

  tags = var.tags

}

# TODO Use new resource when exists
resource "null_resource" "trust" {
  count = var.environment_acronym == "dv" ? 1 : 0

  depends_on = [azurerm_container_registry.container_registry[0]]
  provisioner "local-exec" {
    command = "az login --service-principal --username ${var.client_id} --password ${var.client_secret}  --tenant ${var.tenant_id}"
  }
  provisioner "local-exec" {
    command = "az acr config content-trust update --registry ${azurerm_container_registry.container_registry[0].name} --status enabled"
  }
}

resource "azurerm_monitor_diagnostic_setting" "az-acr-gov-diag" {
  count = var.environment_acronym == "dv" ? 1 : 0

  name                           = "${azurerm_container_registry.container_registry[0].name}diag"
  target_resource_id             = azurerm_container_registry.container_registry[0].id
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.hub.id
  eventhub_name                  = azurerm_eventhub.hub_events.name
  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.hub_events_namespace_auth_rule.id
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


