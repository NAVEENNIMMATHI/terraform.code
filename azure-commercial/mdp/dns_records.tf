#resource "azurerm_private_dns_cname_record" "example" {
#  name                = azurerm_databricks_workspace.mdp_adb.workspace_url
#  zone_name           = data.azurerm_private_dns_zone.dns_zone_databricks.name
#  resource_group_name = data.azurerm_private_dns_zone.dns_zone_databricks.resource_group_name
#  ttl                 = 300
#  record              = "eastus2-c2.azuredatabricks.net"
#}