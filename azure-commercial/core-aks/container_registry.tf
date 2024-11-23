module "container_registry" {
  source                   = "../../modules12/container_registry"
  container_registry_name  = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}"
  resource_group_location  = data.azurerm_resource_group.hubvnet.location
  resource_group_name      = data.azurerm_resource_group.hubvnet.name
  allowed_ip_range_list    = [
      "199.207.253.0/24",
      "199.206.0.5/32",
      "${data.azurerm_public_ip.fw_pip_1.ip_address}/32",
      "${data.azurerm_public_ip.fw_pip_2.ip_address}/32",
      "${data.azurerm_public_ip.fw_pip_3.ip_address}/32",
      "${data.azurerm_public_ip.fw_pip_4.ip_address}/32",
      "${data.azurerm_public_ip.fw_pip_5.ip_address}/32"
  ]
  georeplication_locations = ["westus"]
  devops_spn_appid         = var.client_id
  devops_spn_secret        = var.client_secret
  tenant_id                = var.tenant_id
  subnet_id_list           = [azurerm_subnet.aks[0].id]

  tags                     = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "acr_core_diag" {
  name                           = "acr${var.location_acronym}${var.application_acronym}${var.environment_acronym}-diag"
  target_resource_id             = module.container_registry.id
  log_analytics_workspace_id     = data.azurerm_log_analytics_workspace.corelogs.id
  eventhub_name                  = data.azurerm_eventhub.hub_events.name
  eventhub_authorization_rule_id = data.azurerm_eventhub_namespace_authorization_rule.hub_events_namespace_auth_rule.id
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