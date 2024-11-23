resource "azurerm_user_assigned_identity" "artifactory" {
  count               = 1

  name                = "uai-use-core-artifactory-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.aks[0].name
  location            = azurerm_resource_group.aks[0].location
  tags                = var.tags_Artifactory
}

resource "azurerm_user_assigned_identity" "cloudockit" {
  count               = 1

  name                = "uai-use-core-cloudockit-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.aks[0].name
  location            = azurerm_resource_group.aks[0].location
  tags                = var.tags_Cloudockit
}

resource "azurerm_user_assigned_identity" "devopsagent" {
  count = 1

  name                = "uai-use-core-devopsagent-${var.environment_acronym}"
  resource_group_name = azurerm_resource_group.aks[0].name
  location            = azurerm_resource_group.aks[0].location
  tags                = var.tags_BuildAgent
}