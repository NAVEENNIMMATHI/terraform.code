/*
resource "azurerm_postgresql_server" "pgs-aks-core" {}
resource "azurerm_private_endpoint" "pgs-aks-core" {}
resource "azurerm_monitor_diagnostic_setting" "pgs-aks-core" {}
resource "azurerm_postgresql_database" "artifactorydb" {}
resource "azurerm_postgresql_database" "xraydb" {}
resource "azurerm_postgresql_database" "missioncontroldb" {}
*/
## Moved to Core-AKS folder ##