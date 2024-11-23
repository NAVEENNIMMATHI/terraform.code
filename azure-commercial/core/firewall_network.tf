locals {
 DV_CSM_eventhub_authorization_rule_id =  "/subscriptions/1b1fa7fd-95a5-482c-a5d9-f130d9f27de6/resourceGroups/CO-NP-DSG-CSM-rg/providers/Microsoft.EventHub/namespaces/loggingDataa3hnlej6n7toq/authorizationRules/RootManageSharedAccessKey" 
 PD_CSM_eventhub_authorization_rule_id =  "/subscriptions/b6b0464c-5e55-4a81-836a-6d24560157c1/resourceGroups/CO-P-Eastus-DSG-CSM-RG/providers/Microsoft.EventHub/namespaces/loggingDatahhufierokcjo6/authorizationRules/RootManageSharedAccessKey"
}
output "firewall_private_ip" {
  value = azurerm_firewall.firewall.ip_configuration.0.private_ip_address
}

resource "azurerm_firewall" "firewall" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "firewall-primary-${var.firewall_environment}" : "fwl-${var.location_acronym}-primary-${var.firewall_environment}"
  location            = azurerm_resource_group.hubvnet.location
  resource_group_name = azurerm_resource_group.hubvnet.name
  firewall_policy_id  = var.firewall_policy_id
  sku_name            = "AZFW_VNet"
  sku_tier            = "Premium"

  ip_configuration {
    name                 = var.ip_confi_name1
    subnet_id            = azurerm_subnet.azure-firewall-subnet.id
    public_ip_address_id = module.fw_pip_1.public_ip_id

  }
  ip_configuration {
    name                 = var.ip_confi_name2
    public_ip_address_id = module.fw_pip_2.public_ip_id
  }
  ip_configuration {
    name                 = var.ip_confi_name3
    public_ip_address_id = module.fw_pip_3.public_ip_id
  }
  ip_configuration {
    name                 = var.ip_confi_name4
    public_ip_address_id = module.fw_pip_4.public_ip_id
  }
  ip_configuration {
    name                 = var.ip_confi_name5
    public_ip_address_id = module.fw_pip_5.public_ip_id
  }
  

  #dns_servers = var.hub_vnet_dns_servers

  tags = var.tags_Networking
  zones = var.firewall_avail_zones
}


resource "azurerm_monitor_diagnostic_setting" "azfwlogs" {
  name                           = "azfw_debug_logs"
  target_resource_id             = azurerm_firewall.firewall.id
  log_analytics_workspace_id     = azurerm_log_analytics_workspace.hub.id
  log_analytics_destination_type = "AzureDiagnostics"

  log {
    category = "AzureFirewallApplicationRule"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 7
    }
  }

  log {
    category = "AzureFirewallNetworkRule"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 7
    }
  }

  log {
    category = "AzureFirewallDnsProxy"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWApplicationRule"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWApplicationRuleAggregation"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWDnsQuery"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWFatFlow"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWFqdnResolveFailure"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWIdpsSignature"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWNatRule"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWNatRuleAggregation"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWNetworkRule"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWNetworkRuleAggregation"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "AZFWThreatIntel"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}