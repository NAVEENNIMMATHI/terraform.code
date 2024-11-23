######################
# East US Key Vaults #
######################

resource "azurerm_key_vault" "hub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.key_vault_name}${var.unique_variable_suffix}" : "kvl-${var.location_acronym}-core01-${var.environment_acronym}"
  location            = azurerm_resource_group.backuprecovery.location
  resource_group_name = azurerm_resource_group.backuprecovery.name

  depends_on = [azurerm_recovery_services_vault.hub]

  sku_name            = "standard"
  soft_delete_enabled = true

  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.bms_object_id

    certificate_permissions = [
      "get",
      "list"
    ]

    key_permissions = [
      "get",
      "list"
      # "backup",
    ]

    secret_permissions = [
      "get",
      "list"
      #"backup",
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.disk_encrypt_app_object_id

    key_permissions = [
      "Get",
      "List",
      "Backup"
    ]

    secret_permissions = [
      "get",
      "list",
      "backup"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = "46c70e4d-2526-402e-bde2-05141d6ed675"

    key_permissions = [
      "WrapKey"
    ]

    secret_permissions = [
      "get",
      "Set",
      "list",
      "Backup"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azurerm_user_assigned_identity.keyvaultreader.principal_id

    certificate_permissions = [
      "get",
      "list"
    ]

    key_permissions = [
      "get",
      "list"
    ]

    secret_permissions = [
      "get",
      "list"
    ]
  }

  enabled_for_deployment          = "true"
  enabled_for_template_deployment = "true"
  enabled_for_disk_encryption     = "true"

  network_acls {
    default_action            = "Deny"
    bypass                    = "AzureServices"
    ip_rules = []
    virtual_network_subnet_ids = [
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.squidvmsubnet.id,
      azurerm_subnet.packer.id,
      var.aks_subnet_id,
      var.aks_agw_subnet_id,
      azurerm_subnet.build_agent.id
    ] 
  }

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "hub_diag" {
  name               = "${azurerm_key_vault.hub.name}-diag"
  target_resource_id = azurerm_key_vault.hub.id
  storage_account_id = azurerm_storage_account.hub_kv_diaglogs.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

  log {
    category = "AzurePolicyEvaluationDetails"
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

resource "azurerm_key_vault" "copeusopskeys01hub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.copeusopskeys01hub_key_vault_name}${var.unique_variable_suffix}" : "kvl-${var.location_acronym}-opscore01-${var.environment_acronym}"
  location            = azurerm_resource_group.opscore.location
  resource_group_name = azurerm_resource_group.opscore.name

  sku_name = "standard"

  soft_delete_enabled = true

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = var.key_vault_ip_list
    virtual_network_subnet_ids = [azurerm_subnet.infra1.id, var.aks_subnet_id]
  }

  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.vm_password_rotation_object_id

    certificate_permissions = [
      "get",
      "list"
    ]

    key_permissions = [
      "get",
      "list"
    ]

    secret_permissions = [
      "get",
      "set",
      "list"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.devops_group_object_id

    key_permissions = [
      "Get",
      "list",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "backup"
    ]
  }

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "copeusopskeys01hub_diag" {
  name               = "${azurerm_key_vault.copeusopskeys01hub.name}-diag"
  target_resource_id = azurerm_key_vault.copeusopskeys01hub.id
  storage_account_id = azurerm_storage_account.opskeys01hubdiaglogs.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

  log {
    category = "AzurePolicyEvaluationDetails"
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

resource "azurerm_key_vault" "DSG-PIP-scraper-kv" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "DSG-PIP-scraper-kv${var.unique_variable_suffix}" : "kvl-${var.location_acronym}-dsgpipscr-${var.environment_acronym}"
  location            = azurerm_resource_group.co-p-eastus-DSG-PIP-scraper-rg.location
  resource_group_name = azurerm_resource_group.co-p-eastus-DSG-PIP-scraper-rg.name
  soft_delete_enabled = true
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  network_acls {
    default_action            = "Deny"
    bypass                    = "None"
    ip_rules = []
    virtual_network_subnet_ids = [
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.squidvmsubnet.id,
      azurerm_subnet.packer.id,
      var.aks_subnet_id,
      var.aks_agw_subnet_id,
      azurerm_subnet.build_agent.id
    ] 
  }

  tags = var.tags
}

data "azuread_service_principal" "azure_backup_service" {
  display_name = "Backup Management Service"
}

resource "azurerm_key_vault" "azure_disk_encryption_kv" {
  name                = var.diskencryptvault_name
  location            = data.azurerm_resource_group.disk_encrypt.location
  resource_group_name = data.azurerm_resource_group.disk_encrypt.name

  sku_name = "standard"

  tenant_id = data.azurerm_client_config.current.tenant_id

  enabled_for_deployment          = "true"
  enabled_for_template_deployment = "true"
  enabled_for_disk_encryption     = "true"

  network_acls {
    default_action            = "Deny"
    bypass                    = "AzureServices"
    ip_rules = []
    virtual_network_subnet_ids = [
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.squidvmsubnet.id,
      azurerm_subnet.packer.id,
      var.aks_subnet_id,
      var.aks_agw_subnet_id,
      azurerm_subnet.build_agent.id
    ] 
  }

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "azure_backup_service" {
  key_vault_id = azurerm_key_vault.azure_disk_encryption_kv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azuread_service_principal.azure_backup_service.object_id

  key_permissions = [
    "get",
    "list",
    "backup"
  ]

  secret_permissions = [
    "get",
    "list",
    "backup"
  ]

}

resource "azurerm_monitor_diagnostic_setting" "DSG-PIP-scraper-kv_diag" {
  name               = "${azurerm_key_vault.DSG-PIP-scraper-kv.name}-diag"
  target_resource_id = azurerm_key_vault.DSG-PIP-scraper-kv.id
  storage_account_id = azurerm_storage_account.dsg-pip-scraper-kv.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

  log {
    category = "AzurePolicyEvaluationDetails"
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

/*
resource "azurerm_key_vault_access_policy" "devopsagent" {}
resource "azurerm_key_vault_access_policy" "artifactory" {}
resource "azurerm_key_vault_access_policy" "cloudockit" {}
*/
## Moved to Core-AKS folder ##


######################
# West US Key Vaults #
######################

resource "azurerm_key_vault" "wuhub" {
  name                = (var.environment_acronym == "dv" || var.environment_acronym == "pd") ? "${var.wu_key_vault_name}${var.unique_variable_suffix}" : "kvl-${var.location_dr_acronym}-core01-${var.environment_acronym}"
  location            = azurerm_resource_group.wubackuprecovery.location
  resource_group_name = azurerm_resource_group.wubackuprecovery.name

  depends_on = [azurerm_recovery_services_vault.wuhub]

  sku_name            = "standard"
  soft_delete_enabled = true

  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.bms_object_wus_id

    key_permissions = [
      "get",
      "list",
      "backup",
    ]

    secret_permissions = [
      "get",
      "list",
      "backup",
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.wu_disk_encrypt_app_object_id

    #object_id = ""

    key_permissions = [
      "wrapkey",
    ]
    secret_permissions = [
      "get",
      "set",
      "list",
      "backup",
    ]
  }

  enabled_for_disk_encryption = true

  network_acls {
    default_action            = "Deny"
    bypass                    = "AzureServices"
    ip_rules = []
    virtual_network_subnet_ids = [
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.squidvmsubnet.id,
      azurerm_subnet.packer.id,
      var.aks_subnet_id,
      var.aks_agw_subnet_id,
      azurerm_subnet.build_agent.id
    ] 
  }

  tags = var.tags
}

# resource "azurerm_monitor_diagnostic_setting" "wuhub-diag" {
#   name               = "${azurerm_key_vault.wuhub.name}-diag"
#   target_resource_id = azurerm_key_vault.wuhub.id
#   storage_account_id = azurerm_storage_account.wudiagnosticslogs.id

#   log {
#     category = "AuditEvent"
#     enabled  = true

#     retention_policy {
#       enabled = true
#       days    = 365
#     }
#   }

#   metric {
#     category = "AllMetrics"
#     enabled  = false

#     retention_policy {
#       days    = 0
#       enabled = false
#     }
#   }
# }

resource "azurerm_key_vault" "key_vault_common" {
  count                           = var.environment_acronym == "dv" ? 1 : 0
  name                            = "kvl-${var.location_acronym}-shared-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name             = azurerm_resource_group.co-p-eastus-terraformfiles-rg.name
  location                        = azurerm_resource_group.co-p-eastus-terraformfiles-rg.location
  sku_name                        = "standard"
  soft_delete_enabled             = true
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true

  enable_rbac_authorization       = true

  network_acls {
    default_action            = "Deny"
    bypass                    = "AzureServices"
    ip_rules = []
    virtual_network_subnet_ids = [
      azurerm_subnet.corease.id,
      azurerm_subnet.dmpe.id,
      azurerm_subnet.dmworkers.id,
      azurerm_subnet.infra1.id,
      azurerm_subnet.hybridworker.id,
      azurerm_subnet.squidvmsubnet.id,
      azurerm_subnet.packer.id,
      var.aks_subnet_id,
      var.aks_agw_subnet_id,
      azurerm_subnet.build_agent.id
    ] 
  }

  tags                            = var.tags

}