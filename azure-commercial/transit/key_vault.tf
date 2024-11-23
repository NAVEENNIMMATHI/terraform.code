resource "azurerm_key_vault" "transit" {
  name                = "co${lower(var.environment)}euskeyv01${var.applicationname}${var.uniqueresourcesuffix1}"
  location            = "${azurerm_resource_group.transitbackuprecovery.location}"
  resource_group_name = "${azurerm_resource_group.transitbackuprecovery.name}"
  depends_on          = ["azurerm_recovery_services_vault.transit"]

  sku {
    name = "standard"
  }

  tenant_id = "${data.azurerm_client_config.current.tenant_id}"
  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${var.L2Ops_ObjectID}" #Object ID for Group CO-L2Ops-A
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
    
  }

  


  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${var.BMSObjectID}"

    key_permissions = [
      "Get",
      "List",
      "Backup",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Backup",
    ]
  }

  access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${var.SPN_ObjectID}" #ObjectID of DiskEncryptApp

    key_permissions = [
      "WrapKey"
    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Backup"
    ]
  }
  enabled_for_disk_encryption = true
  tags = "${var.tags}"

}
