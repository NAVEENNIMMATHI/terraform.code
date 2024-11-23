resource "azurerm_key_vault" "key_vault" {
  name                = "${var.abla_keyvault_name}"
  location            = "${module.applicationrg.resource_group_location}"
  resource_group_name = "${module.applicationrg.resource_group_name}"
  enabled_for_disk_encryption = true

  sku {
    name = "standard"
  }

  tenant_id = "${data.azurerm_client_config.current.tenant_id}"
 access_policy {
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${var.abla_keyvault_user_obj_id}"

    key_permissions = [
      "get",
      "list",
      "update",
      "create",
      "import",
      "delete" ,
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
      "restore"
    ]

    certificate_permissions = [
     "get",
     "list",
     "Update",
     "Create",
     "Import",
     "Delete" ,
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

    storage_permissions = [
      "backup", "delete","deletesas", "get","getsas", "list", "listsas", "purge", "recover", "regeneratekey","restore",  "set","setsas","update"
    ]

  }
 network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"

    ip_rules = [
        "199.207.253.101/32",
        "199.207.253.96/32"
    ]
    virtual_network_subnet_ids = ["/subscriptions/9e27f52c-3c97-4fda-9c8f-eadcd0ad195a/resourcegroups/CO-P-eastus-coabla-rg/providers/microsoft.network/virtualnetworks/CO-P-eastus-coabla-vnet/subnets/CO-P-eastus-ablaase1-subnet"]
  }

  tags = "${var.tags}"
}