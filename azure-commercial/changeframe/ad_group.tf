resource "azuread_group" "sql_server_admins" {
    #name = "CO-CFR-SQL-Admins${upper(var.ad_group_environment_suffix)}"
    name = "CO-${upper(var.application_acronym)}-SQL-Admins${upper(var.ad_group_environment_suffix)}"
}

resource "azuread_group" "web_app_users" {
   # name = "CO-CFR-WebApp-Users${upper(var.ad_group_environment_suffix)}"
   name = "CO-${upper(var.application_acronym)}-WebApp-Users${upper(var.ad_group_environment_suffix)}"

}