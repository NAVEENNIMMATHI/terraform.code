resource "azuread_group" "sql_server_admins" {
  name = "CO-KME-SQL-Admins${upper(var.ad_group_environment_suffix)}"
}

resource "azuread_group" "webapplication_users" {
  name = "CO-KME-WebApp-Users${upper(var.ad_group_environment_suffix)}"
}