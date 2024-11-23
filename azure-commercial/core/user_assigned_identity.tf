# Create User Assigned Identity (Type of Managed Identity)
resource "azurerm_user_assigned_identity" "keyvaultreader" {
  name                = "uai-use-keyvaultreader-${var.legacy_env_acronym}"
  resource_group_name = azurerm_resource_group.loganalytics.name
  location            = azurerm_resource_group.loganalytics.location
  tags                = var.tags
}

resource "azurerm_user_assigned_identity" "hybridbenefit" {
  name                = "uai-use-hybridbenefit-${var.legacy_env_acronym}"
  resource_group_name = azurerm_resource_group.loganalytics.name
  location            = azurerm_resource_group.loganalytics.location
  tags                = var.tags
}

/*
resource "azurerm_user_assigned_identity" "artifactory" {}
resource "azurerm_user_assigned_identity" "devopsagent" {}
resource "azurerm_user_assigned_identity" "cloudockit" {}
*/
## Moved to Core-AKS folder ##