resource "azurerm_key_vault" "key_vault" {
  name                = "kvl-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  resource_group_name = module.cmbsrg.resource_group_name
  location            = module.cmbsrg.resource_group_location

  sku_name               = "standard"
  tenant_id              = var.tenant_id
  enabled_for_deployment = "true"

  access_policy {
    tenant_id = var.tenant_id
    object_id = azurerm_function_app.functionapp.identity.0.principal_id

    certificate_permissions = []

    key_permissions = [
      "get",
      "list"
    ]

    secret_permissions = [
      "get",
      "list",
      "set"
    ]
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_service_principal.cmbsdataexport.object_id

    certificate_permissions = []

    key_permissions = []

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge"
    ]
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = azuread_service_principal.spn_dataexport_d365.object_id

    certificate_permissions = []

    key_permissions = []

    secret_permissions = [
      "Get"
    ]
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = azuread_service_principal.spn_devops_cmbs_app_service.object_id

    key_permissions = []

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    certificate_permissions = []
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_group.cloudops_keyvault_admin.object_id

    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers",
      #"Purge",
    ]

    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_group.client_keyvault_admin.object_id

    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]

    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete",
      "recover",
      "backup",
      "restore"
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore",
      "Purge"
    ]
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_service_principal.backupmanagementservicesp.object_id

    key_permissions = [
      "Get",
      "List",
      "Backup"
    ]

    secret_permissions = [
      "Get",
      "List",
      "Backup"
    ]
  }

 access_policy {
    tenant_id = var.tenant_id
    object_id = data.azuread_service_principal.ama-use-automation-runbook.object_id

    certificate_permissions = [
      "Get",
      "List",
      "Import",
    ]

    key_permissions = [
      "Get",
      "List",
      "Backup"
    ]

    secret_permissions = [
      "Get",
      "List",
      
    ]
  }

   

  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow"
    ip_rules = [
      "103.58.118.81/32",
      "40.112.139.218/32",
      "65.55.132.0/24",
      "134.170.26.0/24",
      "65.55.135.0/24",
      "66.119.148.0/24",
      "104.44.113.0/24",
      "104.44.114.0/24",
      "104.44.249.0/25",
      "104.44.249.128/25",
      "13.106.108.0/25",
      "13.106.72.128/25",
      "13.88.20.122/32",
      "13.92.199.78/32",
      "13.107.6.169/32",
      "13.107.9.169/32",
      "23.96.92.86/32"
    ]
  }

  tags = var.tags
}