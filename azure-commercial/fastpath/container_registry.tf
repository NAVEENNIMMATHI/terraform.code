resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = module.apprg.resource_group_name
  location            = module.apprg.resource_group_location
  sku                 = "Premium"
  admin_enabled       = "true"
  tags                = var.tags

  network_rule_set {
    default_action    = "Allow"
  }
}

resource "null_resource" "import_container_image" {
  count = (var.environment == "legacy_development" || var.environment == "production")  ? 0 : 1

  provisioner "local-exec" {
    command = "az login --service-principal --username ${var.client_id} --password ${var.client_secret} --tenant ${var.tenant_id} && az account set --subscription=${data.azurerm_subscription.current.subscription_id} && az acr import -n ${azurerm_container_registry.acr.name} --force --source quay.io/ukhomeofficedigital/clamav:latest -t clamav:latest"
  }
}