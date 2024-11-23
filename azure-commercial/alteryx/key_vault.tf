resource "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  location            = module.applicationrg.resource_group_location
  resource_group_name = module.applicationrg.resource_group_name
  enabled_for_disk_encryption = false
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_service_principal.MicrosoftAzureFrontdoor.id #Object ID for Group CO-L2Ops-A
    secret_permissions = [
        "Get"
      
    ]
    certificate_permissions = [
      "Get"     
    ]    
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azuread_group.AADDCAdministrators.id

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
  }

   
  
  tags = var.tags

}
