# Generate a new password
resource "random_password" "snow-service-account" {
  length           = 16
  special          = true
  override_special = "_%@"
}

# create service account
resource "azuread_user" "snow-service-account" {
  user_principal_name = var.environment_acronym == "dv" ? "azuser-svc-midserver@${var.user_domain}" : "azuser-svc-mid${var.environment_acronym}@${var.user_domain}"
  display_name        = var.environment_acronym == "dv" ? "azuser-svc-midserver" : "azuser-svc-mid${var.environment_acronym}"
  password            = random_password.snow-service-account.result

  lifecycle {
    ignore_changes = [
      password
    ]
  }
}