resource "azurerm_data_factory" "mdpadf" {
  name                            = "dtf-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  location                        = module.mdp_rg_main.resource_group_location
  resource_group_name             = module.mdp_rg_main.resource_group_name
  managed_virtual_network_enabled = true
  public_network_enabled          = false

  identity {
    type = "SystemAssigned"
  }
  /*
  vsts_configuration {
  account_name = "CO-AzureCore"
  branch_name = "master"
  project_name = "KpmgAdvisoryCloud"
  repository_name = "dtf-${var.location_acronym}-${var.application_acronym}-${var.environment_acronym}"
  root_folder = "/"
  tenant_id = var.tenant_id

}
*/

  vsts_configuration {
    account_name    = "CO-AzureCore"
    branch_name     = "master"
    project_name    = "KpmgAdvisoryCloud"
    tenant_id       = var.tenant_id
    repository_name = var.environment == "production" ?  "dtf-use-mdp-dv" : "mdp-data-factory"
    root_folder     = "/"
  }
  tags = var.tags
}


resource "azurerm_data_factory_integration_runtime_azure" "mdp_adf_integration_runtime" {
  name                    = "AzureIntegratedRuntime"
  data_factory_name       = azurerm_data_factory.mdpadf.name
  location                = module.mdp_rg_main.resource_group_location
  resource_group_name     = module.mdp_rg_main.resource_group_name
  virtual_network_enabled = true
}


/*
resource "azurerm_data_factory_integration_runtime_managed" "mdp_adfmir" {
   name                             = "dtf-${var.location_acronym}-${var.application_acronym}-irm-${var.environment_acronym}"
   data_factory_name                = azurerm_data_factory.mdpadf.name
   resource_group_name              = module.mdp_rg_main.resource_group_name
   location                         = module.mdp_rg_main.resource_group_location
   node_size                        = var.node_size
   number_of_nodes                  = var.number_of_nodes
   max_parallel_executions_per_node = var.max_parallel_executions_per_node
   edition                          = var.edition
   license_type                     = var.license_type
   
   vnet_integration {
       vnet_id                      = module.mdpvnetmain.virtual_network_id
       subnet_name                  = module.mdp_subnet_adf.subnet_name
   }
}

*/
/* terraform plan giving error hence commented all managed private endpoints */

resource "azurerm_data_factory_managed_private_endpoint" "dlsmanagedpep" {
  name               = "mgd_pep_dls_${var.location_acronym}_mdp${var.environment_acronym}" #Managed Private Endpoint name, must match the regular expression ^[A-Za-z0-9_]+ 
  data_factory_id    = azurerm_data_factory.mdpadf.id
  target_resource_id = module.mdp_dls_main.id
  subresource_name   = "blob"
}


resource "azurerm_data_factory_managed_private_endpoint" "synapsemanagedpepsql" {
  name               = "mgd_pep_synapsesql_${var.location_acronym}_mdp${var.environment_acronym}" #Managed Private Endpoint name, must match the regular expression ^[A-Za-z0-9_]+ 
  data_factory_id    = azurerm_data_factory.mdpadf.id
  target_resource_id = azurerm_synapse_workspace.mdpsynapse.id
  subresource_name   = "Sql"
}

resource "azurerm_data_factory_managed_private_endpoint" "synapsemanagedpepsqlondemand" {
  name               = "mgd_pep_synapsesqlondemand_${var.location_acronym}_mdp${var.environment_acronym}" #Managed Private Endpoint name, must match the regular expression ^[A-Za-z0-9_]+ 
  data_factory_id    = azurerm_data_factory.mdpadf.id
  target_resource_id = azurerm_synapse_workspace.mdpsynapse.id
  subresource_name   = "SqlOnDemand"
}

resource "azurerm_data_factory_managed_private_endpoint" "synapsemanagedpepdev" {
  name               = "mgd_pep_synapsedev_${var.location_acronym}_mdp${var.environment_acronym}" #Managed Private Endpoint name, must match the regular expression ^[A-Za-z0-9_]+
  data_factory_id    = azurerm_data_factory.mdpadf.id
  target_resource_id = azurerm_synapse_workspace.mdpsynapse.id
  subresource_name   = "Dev"
}

resource "azurerm_data_factory_managed_private_endpoint" "keyvaultmanagedpep" {
  name               = "mgd_pep_keyvault_${var.location_acronym}_mdp${var.environment_acronym}" #Managed Private Endpoint name, must match the regular expression ^[A-Za-z0-9_]+ 
  data_factory_id    = azurerm_data_factory.mdpadf.id
  target_resource_id = azurerm_key_vault.mdpkv.id
  subresource_name   = "vault"
}


