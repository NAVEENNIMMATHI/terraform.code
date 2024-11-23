
/*
resource "azurerm_role_assignment" "spipaasadf_central_svp" {
  scope              = module.sqlserver01_central.sql_server_id
  role_definition_name = "Data Factory Contributor"
  principal_id       = azuread_application.spipaas_dtf.object_id 
  depends_on = [ azuread_application.spipaas_dtf ]
}*/
resource "azurerm_role_assignment" "spipaasweb-dtf-contributor" {
  scope              = azurerm_data_factory.spipaasadf_central.id
  role_definition_name = "Data Factory Contributor"
  principal_id       = azurerm_app_service.appservice_spipaas_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaas_central,azurerm_data_factory.spipaasadf_central ]
}
resource "azurerm_role_assignment" "spipaasweb-member-storage-contributor" {
  scope              = module.spipaasappdata01sa[each.key].id
  for_each = var.storage_account_data
  role_definition_name = "Storage Blob Data Contributor"
  principal_id       = azurerm_app_service.appservice_spipaas_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaas_central,module.spipaasappdata01sa ]
}
resource "azurerm_role_assignment" "spipaasweb-sqlserver-central-contributor" {
  scope              = module.sqlserver01_central.sql_server_id
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_app_service.appservice_spipaas_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaas_central,module.sqlserver01_central ]
}
resource "azurerm_role_assignment" "spipaasrest-dtf-contributor" {
  scope              = azurerm_data_factory.spipaasadf_central.id
  role_definition_name = "Data Factory Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrest_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrest_central,azurerm_data_factory.spipaasadf_central ]
}
resource "azurerm_role_assignment" "spipaasrest-member-storage-contributor" {
  scope              = module.spipaasappdata01sa[each.key].id
  for_each = var.storage_account_data
  role_definition_name = "Storage Blob Data Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrest_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrest_central,module.spipaasappdata01sa ]
}
resource "azurerm_role_assignment" "spipaasrest-sqlserver-central-contributor" {
  scope              = module.sqlserver01_central.sql_server_id
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrest_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrest_central,module.sqlserver01_central ]
}
resource "azurerm_role_assignment" "spipaasrepgenrest-member-storage-contributor" {
  scope              = module.spipaasappdata01sa[each.key].id
  for_each = var.storage_account_data
  role_definition_name = "Storage Blob Data Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrepgenrest[each.key].identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrepgenrest,module.spipaasappdata01sa ]
}
resource "azurerm_role_assignment" "spipaasrepgenrest-sqlserver-prod-contributor" {
  scope              = module.sqlserverprod[each.key].sql_server_id
  for_each =var.sql_server_app
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrepgenrest[each.key].identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrepgenrest,module.sqlserverprod ]
}
resource "azurerm_role_assignment" "spipaasrepgenrest-sqlserver-app-contributor" {
  scope              =  module.sqlserverapp[each.key].sql_server_id
  for_each =  var.sql_server_prod
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrepgenrest[each.key].identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrepgenrest,module.sqlserverapp ]
}
resource "azurerm_role_assignment" "spipaasrepgenrest-sqlserver-stage-contributor" {
  scope              = module.sqlserverstage[each.key].sql_server_id
  for_each = var.sql_server_stage
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrepgenrest[each.key].identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrepgenrest,module.sqlserverstage ]
}
resource "azurerm_role_assignment" "spipaasrepgenrest-dtf-contributor" {
  scope              = azurerm_data_factory.spipaasadf_central.id
  for_each = var.appservice
  role_definition_name = "Data Factory Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrepgenrest[each.key].identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrepgenrest,azurerm_data_factory.spipaasadf_central ]
}
resource "azurerm_role_assignment" "dtf-sqlserver-central-contributor" {
  scope              = module.sqlserver01_central.sql_server_id
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_data_factory.spipaasadf_central.identity[0].principal_id
  depends_on = [ azurerm_data_factory.spipaasadf_central,module.sqlserver01_central ]
}
resource "azurerm_role_assignment" "dtf-resource-group-contributor" {
  for_each = var.application_rg
  scope              = module.applicationrg[each.key].resource_group_id
  role_definition_name = "Contributor"
  principal_id       = azurerm_data_factory.spipaasadf_central.identity[0].principal_id
  depends_on = [ module.applicationrg,azurerm_data_factory.spipaasadf_central ]
}
resource "azurerm_role_assignment" "dtf-sqlserver-prod-contributor" {
  scope              = module.sqlserverprod[each.key].sql_server_id
  for_each =var.sql_server_app
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_data_factory.spipaasadf_central.identity[0].principal_id 
  depends_on = [ azurerm_data_factory.spipaasadf_central,module.sqlserverprod ]
}
resource "azurerm_role_assignment" "dtf-sqlserver-app-contributor" {
  scope              =  module.sqlserverapp[each.key].sql_server_id
  for_each =  var.sql_server_prod
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_data_factory.spipaasadf_central.identity[0].principal_id 
  depends_on = [ azurerm_data_factory.spipaasadf_central,module.sqlserverapp ]
}
resource "azurerm_role_assignment" "dtf-sqlserver-stage-contributor" {
  scope              = module.sqlserverstage[each.key].sql_server_id
  for_each = var.sql_server_stage
  role_definition_name = "SQL DB Contributor"
  principal_id       = azurerm_data_factory.spipaasadf_central.identity[0].principal_id 
  depends_on = [ azurerm_data_factory.spipaasadf_central,module.sqlserverstage ]
}
resource "azurerm_role_assignment" "dtf-identity-contributor" {
  scope              = azurerm_data_factory.spipaasadf_central.id
  role_definition_name = "Data Factory Contributor"
  principal_id       = azurerm_data_factory.spipaasadf_central.identity[0].principal_id 
  depends_on = [ azurerm_data_factory.spipaasadf_central ]
}
resource "azurerm_role_assignment" "spipaasrest-central-storage-contributor" {
  scope              = module.spipaascentralappdata01sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id       = azurerm_app_service.appservice_spipaasrest_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaasrest_central,module.spipaascentralappdata01sa ]
}
resource "azurerm_role_assignment" "spipaasweb-central-storage-contributor" {
  scope              = module.spipaascentralappdata01sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id       = azurerm_app_service.appservice_spipaas_central.identity[0].principal_id
  depends_on = [ azurerm_app_service.appservice_spipaas_central,module.spipaascentralappdata01sa ]
}
resource "azurerm_role_assignment" "dtf-central-storage-contributor" {
  scope              = module.spipaascentralappdata01sa.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id       = azurerm_data_factory.spipaasadf_central.identity[0].principal_id 
  depends_on = [ module.spipaascentralappdata01sa,azurerm_data_factory.spipaasadf_central ]
}