# Resource Group

resource "azurerm_resource_group" "this" {
  name     = "RGP-USE-COMMON"
  location = "eastus"

  tags     = {
    Platform                  = var.platform
    Environment               = var.environment
    Node                      = var.node
    Solution                  = var.solution
    LOB                       = var.service_group
  }
}

resource "azurerm_resource_group" "backup_east" {
  name     = "AzureBackupRG_eastus_1"
  location = "eastus"

  tags     = {
    Platform                  = var.platform
    Environment               = var.environment
    Node                      = var.node
    Solution                  = var.solution
    LOB                       = var.service_group
  }
}

resource "azurerm_resource_group" "backup_west" {
  name     = "AzureBackupRG_westus_1"
  location = "westus"

  tags     = {
    Platform                  = var.platform
    Environment               = var.environment
    Node                      = var.node
    Solution                  = var.solution
    LOB                       = var.service_group
  }
}


# Storage Account

resource "azurerm_storage_account" "this" {
  name                         = "stousecommon${var.subscription_id_first_chars}"
  resource_group_name          = azurerm_resource_group.this.name
  location                     = azurerm_resource_group.this.location
  account_tier                 = "Standard"
  account_replication_type     = "LRS"
  enable_https_traffic_only    = true
  account_kind                 = "StorageV2"
  is_hns_enabled               = false

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["199.206.0.0/25"]
    virtual_network_subnet_ids = var.environment == "Sandbox" || var.environment == "QA" || var.environment == "Development" ? ["/subscriptions/4cdcf904-fa57-4815-8cb3-e33b9b44f479/resourceGroups/co-np-eastus-core1-rg/providers/Microsoft.Network/virtualNetworks/co-np-eastus-core1-vnet/subnets/co-np-eastus-infra1-subnet", "/subscriptions/c72acede-d539-45d9-963d-3464ec4ddae0/resourceGroups/CO-dv-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-dv-eastus-hub-vnet/subnets/sub-use-core-aks-dv"] : ["/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/co-p-eastus-infra1-subnet", "/subscriptions/4c9dc048-01dc-4854-9063-8a3d4060993a/resourceGroups/CO-P-eastus-hubvnet-rg/providers/Microsoft.Network/virtualNetworks/CO-P-eastus-hub-vnet/subnets/sub-use-core-aks-pd"]
  }

  tags     = {
    Platform                  = var.platform
    Environment               = var.environment
    Node                      = var.node
    Solution                  = var.solution
    LOB                       = var.service_group
  }
}

# Storage Account Containers

resource "azurerm_storage_container" "terraform_state" {
  name                  = "terraformstatecontainer"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "terraform_plan" {
  name                  = "terraformplancontainer"
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}


# Key Vault

resource "azurerm_key_vault" "this" {
  name                = "kvl-use-common-${var.subscription_id_first_chars}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  sku_name = "standard"
  soft_delete_enabled = true
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_service_principal.backup_management_services.object_id

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

  tags     = {
    Platform                  = var.platform
    Environment               = var.environment
    Node                      = var.node
    Solution                  = var.solution
    LOB                       = var.service_group
  }
}

resource "azurerm_monitor_diagnostic_setting" "wuhub-diag" {
  name                       = "${azurerm_key_vault.this.name}-diag"
  target_resource_id         = azurerm_key_vault.this.id
  storage_account_id         = azurerm_storage_account.this.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days = 365
    }
  }
}

resource "azurerm_key_vault" "diskencryptvault" {
  name                = "kvl-use-ade-${var.subscription_id_first_chars}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  sku_name = "standard"
  soft_delete_enabled = true
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  enabled_for_deployment = true
  enabled_for_template_deployment = true


  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_service_principal.backup_management_services.object_id

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

  tags     = {
    Platform                  = var.platform
    Environment               = var.environment
    Node                      = var.node
    Solution                  = var.solution
    LOB                       = var.service_group
  }
}

resource "azurerm_key_vault_key" "diskencrypt" {
  name         = "diskencryption"
  key_vault_id = azurerm_key_vault.diskencryptvault.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "azurerm_monitor_diagnostic_setting" "encrypt-vault-diag" {
  name                       = "${azurerm_key_vault.diskencryptvault.name}-diag"
  target_resource_id         = azurerm_key_vault.diskencryptvault.id
  storage_account_id         = azurerm_storage_account.this.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days = 365
    }
  }
}