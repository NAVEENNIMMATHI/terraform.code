resource "azurerm_container_registry" "container_registry" {
  count = var.isEngagement == true ? 0 :1
  depends_on          = [var.aks_subnet]
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = "Premium"
  admin_enabled       = false  

  
  tags = var.tags

  # Geographic replication not working as expected in Gov Cloud
  georeplication_locations = var.georeplication_locations

  network_rule_set {
    default_action = "Deny"

    ip_rule = [
      for ip_range in var.allowed_ip_range_list : {
        action   = "Allow"
        ip_range = ip_range
      }
    ]

    virtual_network = [
      for subnet in var.subnet_id_list : {
        action    = "Allow"
        subnet_id = subnet
      }
    ]
  }
}

# TODO Use new resource when exists
resource "null_resource" "trust" {
  count = var.isEngagement == true ? 0 :1
  depends_on = [azurerm_container_registry.container_registry]
  provisioner "local-exec" {
    command = "az login --service-principal --username ${var.devops_spn_appid} --password ${var.devops_spn_secret} --tenant ${var.tenant_id}"
  }
  provisioner "local-exec" {
    command = "az acr config content-trust update --registry ${azurerm_container_registry.container_registry[0].name} --status enabled"
  }
}
