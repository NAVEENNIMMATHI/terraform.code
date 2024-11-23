##########Custom Website Contributor Role Definition
resource "azurerm_role_definition" "CustomWebsiteContributor" {
  name  = var.RBAC_CustomWebsiteContributor_Name
  scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"

  permissions {
    actions = [
      "Microsoft.Web/certificates/*",
      "Microsoft.Web/listSitesAssignedToHostName/read",
      "Microsoft.Web/serverFarms/read",
      "Microsoft.Web/sites/*",
    ]
  }

  assignable_scopes = [
    "/subscriptions/${data.azurerm_subscription.current.subscription_id}",
  ]
}

##########Custom SQL Managed Instance Contributor Role Definition
resource "azurerm_role_definition" "CustomSQLManagedInstanceContributor" {
  name  = var.RBAC_CustomSQLManagedInstanceContributor_Name
  scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"

  permissions {
    actions = [
      "Microsoft.Sql/locations/*/read",
      "Microsoft.Sql/managedInstances/*",
    ]
  }

  assignable_scopes = [
    "/subscriptions/${data.azurerm_subscription.current.subscription_id}",
  ]
}

##########Custom Storage Account Contributor Role Definition
resource "azurerm_role_definition" "CustomStorageAccountContributor" {
  name  = var.RBAC_CustomStorageAccountContributor_Name
  scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"

  permissions {
    actions = ["Microsoft.Storage/storageAccounts/*"]
  }

  assignable_scopes = [
    "/subscriptions/${data.azurerm_subscription.current.subscription_id}",
  ]
}

##########KeyVault Secret/Certificate/Key Read/List Role Definition
resource "azurerm_role_definition" "KeyVaultRead" {
  name  = var.RBAC_CustomKeyVaultRead_Name
  scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"

  permissions {
    data_actions = [
      "Microsoft.KeyVault/vaults/secrets/readMetadata/action",
      "Microsoft.KeyVault/vaults/secrets/getSecret/action",
      "Microsoft.KeyVault/vaults/certificates/read",
      "Microsoft.KeyVault/vaults/keys/read",
    ]
  }

  assignable_scopes = [
    "/subscriptions/${data.azurerm_subscription.current.subscription_id}",
  ]
}

##########Custom SQL DB Contributor Role Definition
resource "azurerm_role_definition" "CustomSQLDBContributor" {
  name  = var.RBAC_CustomSQLDBContributor_Name
  scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"

  permissions {
    actions = [
      "Microsoft.Sql/locations/*/read",
      "Microsoft.Sql/servers/databases/*",
      "Microsoft.Sql/servers/read",
    ]
  }

  assignable_scopes = [
    "/subscriptions/${data.azurerm_subscription.current.subscription_id}",
  ]
}

########## Custom Data Factory Deployer Role Definition
resource "azurerm_role_definition" "CustomDataFactoryDeployer" {
  name  = var.RBAC_CustomDataFactoryDeployer_Name
  scope = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"

  permissions {
    actions = [
      "Microsoft.Resources/deployments/*",
    ]
  }

  assignable_scopes = [
    "/subscriptions/${data.azurerm_subscription.current.subscription_id}",
  ]
}