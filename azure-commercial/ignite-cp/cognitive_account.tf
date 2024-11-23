resource "azurerm_cognitive_account" "ignitecp-cognitive-account" {
  name                       = "css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}drgsfr-${var.environment}"
  custom_subdomain_name      = "css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}drgsfr-${var.environment}"
  location                   = module.ignite_rg.resource_group_location
  resource_group_name        = module.ignite_rg.resource_group_name
  kind                       = "FormRecognizer"
  sku_name = var.cognitive_sku
  identity {
    type                        = "SystemAssigned"
  }
public_network_access_enabled = true
        network_acls {
           default_action = "Deny" 
           ip_rules       = ["103.58.118.81","199.206.0.5","199.207.253.101","199.207.253.96"] 
		   
        virtual_network_rules {
		 subnet_id = module.ignite_aks_subnet.subnet_id
		}
		}

  tags = var.tags
}


resource "azurerm_cognitive_account" "ignitecp-drgs-cognitive-account" {
  name                       = "css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}drgscv-${var.environment}"
  custom_subdomain_name      = "css-${var.location}-${var.project_acronym}-${var.engagement_name}${var.separator}drgscv-${var.environment}"
  location                   = module.ignite_rg.resource_group_location
  resource_group_name        = module.ignite_rg.resource_group_name
  kind                       = "ComputerVision"
  sku_name = "S1"
  identity {
    type                        = "SystemAssigned"
  }
public_network_access_enabled = true
        network_acls {
           default_action = "Deny" 
           ip_rules       = ["103.58.118.81","199.206.0.5","199.207.253.101","199.207.253.96"] 
		   
        virtual_network_rules {
		 subnet_id = module.ignite_aks_subnet.subnet_id
		}
		}

  tags = var.tags
}