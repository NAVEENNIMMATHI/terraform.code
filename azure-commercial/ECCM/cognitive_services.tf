resource "azurerm_cognitive_account" "eccm_cognitive_service" {
    name                = "css-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
    location            = var.resource_location
    resource_group_name = module.eccm_rg.resource_group_name
    kind                = "CognitiveServices"

    sku_name = "S0"

    identity  {
        type  = "SystemAssigned"
    }
#     public_network_access_enabled = true
#         network_acls {
#             default_action = "Allow"
#             subnet_id = [module.eccm_css_subnet]
#     }
}