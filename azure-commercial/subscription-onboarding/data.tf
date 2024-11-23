data "azurerm_client_config" "current" {
    # No parameters
}
data "azuread_service_principal" "backup_management_services" {
  display_name = "Backup Management Service"
}
