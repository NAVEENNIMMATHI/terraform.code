resource "azurerm_key_vault" "ignite_key_vault" {
  name                        = "kvl-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  location                    = module.ignite_rg.resource_group_location
  resource_group_name         = module.ignite_rg.resource_group_name
  enabled_for_disk_encryption = true
  purge_protection_enabled = true

  sku_name = "standard"

  tenant_id = data.azurerm_client_config.current.tenant_id

   access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_service_principal.devopsspn.object_id

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

    storage_permissions = [
      "Backup",
      "Delete",
      "DeleteSAS",
      "Get",
      "GetSAS",
      "List",
      "ListSAS",
      "Purge",
      "Recover",
      "RegenerateKey",
      "Restore",
      "Set",
      "SetSAS",
      "Update",
    ]
  }

  access_policy { #for AKS Cluster MSI
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = module.kubernetes_cluster_build.principal_id

    certificate_permissions = [
      "Get",         
      "Import",            
    ]

    key_permissions = [
      "Get",      
    ]

    secret_permissions = [
      "Get",     
    ]

    storage_permissions = [
      "Get",    
    ]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = []
    
    virtual_network_subnet_ids = [
        module.ignite_aks_subnet.subnet_id,
        module.ignite_agw_subnet.subnet_id,
        module.ignite_ingress_subnet.subnet_id
    ]
  }

  tags = var.tags
}


