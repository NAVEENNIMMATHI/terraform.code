resource "azuread_group" "rrisqladmin" {
  name = "CO-RRISQLAdmins${upper(var.uniqueresourcesuffix)}"
}