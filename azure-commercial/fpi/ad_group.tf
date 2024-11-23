resource "azuread_group" "fpisqladmin" {
  name        = var.environment == "production" ? "COSPI-FPISQLADMINS" : "COSPI-FPISQLADMINS${upper(var.environment_acronym)}"
  description = "FPI SQL Admins"
}

resource "azuread_group_member" "web_app" {
  group_object_id  = azuread_group.fpisqladmin.id
  member_object_id = azuread_service_principal.ad_webapp_fpi_spn.object_id
}

resource "azuread_group_member" "virtual_machine" {
  count            = var.vm_count
  group_object_id  = azuread_group.fpisqladmin.id
  member_object_id = azurerm_virtual_machine.fpivm[count.index].identity[0].principal_id
}