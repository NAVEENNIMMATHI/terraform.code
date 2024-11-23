resource "azurerm_cognitive_account" "ignite-cognitive-account" {
  name                       = "css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  #custom_subdomain_name      = "css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}${var.environment}"
  location                   = module.ignite_rg.resource_group_location
  resource_group_name        = module.ignite_rg.resource_group_name
  kind                       = "FormRecognizer"
  sku_name = var.cognitive_sku
  /*identity {
    type                        = "SystemAssigned"
  }
public_network_access_enabled = true
        network_acls {
           default_action = "Deny" 
           ip_rules       = ["103.58.118.81","199.206.0.5","199.207.253.101","199.207.253.96"] 
		   virtual_network_rules {
		 
		}
       
		}*/

  tags = var.tags
}