resource "azuread_group" "SQLMI-SQLServerAdmins" {
  name        = var.environment == "p" ? "COSPI-P-DatabricksSQLMI-SQLServerAdmins" : "CO${upper(var.application_acronym)}-Databricks-SQLMI-SQLServerAdmins-${upper(var.environment_acronym)}"
  description = var.environment == "p" ? "COSPI-P-DatabricksSQLMI-SQLServerAdmins" : ""

  lifecycle {
    ignore_changes = [
      members,
      owners
    ]
  }
}