module "appservice" {
  source                  = "../../modules/app_service"
  name                    = var.environment == "production" ? "kart" : "kart${var.application_url_environment_acronym}"
  resource_group_name     = module.applicationrg.resource_group_name
  resource_group_location = module.applicationrg.resource_group_location
  app_service_plan_id     = azurerm_app_service_plan.appserviceplan.id
  tags                    = var.tags
  app_service_backup_name = var.environment == "production" ? "kart" : "kart${var.application_url_environment_acronym}"
  storage_account_url     = "${module.webappbackupsa.primary_blob_endpoint}${azurerm_storage_container.webappbackup.name}${data.azurerm_storage_account_sas.webappbackupsas.sas}"
  client_affinity_enabled = true

  user_assigned_identity = {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.identity.id
    ]
  }
}