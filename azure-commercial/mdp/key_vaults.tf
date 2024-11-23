data "azuread_service_principal" "backupmanagementservicesp" {
  display_name = "Backup Management Service"
}

resource "azurerm_key_vault" "mdpkv" {
  name                        = "kvl-${var.location_acronym}-${var.application_acronym}-${lower(var.environment_acronym)}"
  resource_group_name         = module.mdp_rg_main.resource_group_name
  location                    = module.mdp_rg_main.resource_group_location
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 90

  tags                        = var.tags

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules = [
         "199.207.253.101/32",
         "199.207.253.96/32",
         "103.58.118.81/32",
         "103.216.201.101/32"
    ]
    virtual_network_subnet_ids = [module.mdp_subnet_pep.subnet_id] 
        
  }
  lifecycle {
    ignore_changes = [
      #network_acls
    ]
  }
}

resource "azurerm_key_vault_access_policy" "adf" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_data_factory.mdpadf.identity.0.principal_id

  key_permissions = []

    secret_permissions = [
      "Get",
      "List",
      
    ]
}

#resource "azurerm_key_vault_access_policy" "adb" {
#  key_vault_id = azurerm_key_vault.mdpkv.id
#
#  tenant_id = data.azurerm_client_config.current.tenant_id
#  object_id = azuread_service_principal.mdp_spn_Databricks.object_id
#
#  key_permissions = [
#    "Get",
#    "List",
#  ]
#
#  secret_permissions = [
#    "List",
#    "Get",
#  ]
#}


resource "azurerm_key_vault_access_policy" "fun_main" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_function_app.main.identity.0.principal_id

  key_permissions = []

    secret_permissions = [
      "Get",
      "List",
      
    ]
}

/*
resource "azurerm_key_vault_access_policy" "databricks" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_databricks_workspace.mdp_adb.identity.0.principal_id
  #object_id = azuread_service_principal.mdp_spn_databricks.object_id


  key_permissions = []

    secret_permissions = [
      "Get",
      "List",

    ]
}
*/

resource "azurerm_key_vault_access_policy" "synapse" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_synapse_workspace.mdpsynapse.identity.0.principal_id

  key_permissions = []

    secret_permissions = [
      "Get",
      "List",
    ]
}

resource "azurerm_key_vault_access_policy" "vmmdpiics" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id =   element(module.buildvm_iics.vm_identity_id,0)
  key_permissions = []
    secret_permissions = [
      "Get",
      "List",
    ]

   depends_on           = [module.buildvm_iics]

}

#resource "azurerm_key_vault_access_policy" "vmmdpavscan" {
#  key_vault_id = azurerm_key_vault.mdpkv.id
#
#  tenant_id =   data.azurerm_client_config.current.tenant_id
#  object_id =   element(module.mdp_vm_avscan.vm_identity_id,0)
#  key_permissions = []
#    secret_permissions = [
#      "Get",
#      "List",
#    ]
#
#    depends_on           = [module.mdp_vm_avscan]
#}

resource "azurerm_key_vault_access_policy" "mdp_ad_databricks_final" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azuread_service_principal.mdp_spn_databricks.object_id

  key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]
}

resource "azurerm_key_vault_access_policy" "mdp_group_rg_reader" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azuread_group.mdp_rg_readers.object_id

  key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]
}


resource "azurerm_key_vault_access_policy" "mdp_group_rg_contributor" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azuread_group.mdp_rg_readers.object_id

  key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]
}

#Application Access Policy for Appintg

 resource "azurerm_key_vault_access_policy" "mdp_appintg_contributor" {
  key_vault_id = azurerm_key_vault.mdpkv.id

  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_app_service.web_appintg.identity.0.principal_id

  key_permissions = []

    secret_permissions = [
      "Get",
      "List",
      "Set",
    ]
}
/* As per disucssion with pritu we will not manage Key vault secrets from Terraform refer Story #125415 */
/*
resource "azurerm_key_vault_secret" "adb-rsrc-name" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "adb-rsrc-name"
    value        = azurerm_databricks_workspace.mdp_adb.name
}

resource "azurerm_key_vault_secret" "az-rsrc-grp-name" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "az-rsrc-grp-name"
    value        = module.mdp_rg_main.resource_group_name
}

resource "azurerm_key_vault_secret" "az-subscription-id" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "az-subscription-id"
    value        = var.subscription_id
}

resource "azurerm_key_vault_secret" "dlsusemdpdvaccesskey" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "dlsusemdpdvaccesskey"
    value        = module.mdp_dls_main.primary_access_key
}
*/
resource "azurerm_key_vault_secret" "dlsusemdpconnectionstring" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "dlsusemdpconnectionstring"
    value        = module.mdp_dls_main.primary_connection_string
}
/*
resource "azurerm_key_vault_secret" "iics-breakglass-dev" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "iics-breakglass-dev"
    value        = ""
}

resource "azurerm_key_vault_secret" "iics-breakglass-kpmg" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "iics-breakglass-kpmg"
    value        = ""
}

resource "azurerm_key_vault_secret" "log-analytics-workspace-id" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "log-analytics-workspace-id"
    value        = data.azurerm_log_analytics_workspace.spoke_law.workspace_id
}

resource "azurerm_key_vault_secret" "log-analytics-workspace-key" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "log-analytics-workspace-key"
    value        = data.azurerm_log_analytics_workspace.spoke_law.primary_shared_key
}

resource "azurerm_key_vault_secret" "spn-adb-app-id" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "spn-adb-app-id"
    value        = azuread_service_principal.mdp_spn_databricks.application_id
}

resource "azurerm_key_vault_secret" "spn-adb-directory-id" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "spn-adb-directory-id"
    value        = var.tenant_id
}

resource "azurerm_key_vault_secret" "spn-adb-secret" {
    key_vault_id = azurerm_key_vault.mdpkv.id
    name         = "spn-adb-secret"
    value        = azuread_application_password.mdp_databricks.value
}
*/