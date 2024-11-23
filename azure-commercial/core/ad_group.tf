resource "azuread_group" "govimageapprovers" {
  count = var.environment_acronym == "dv" ? 1 : 0

  name = "gov-container-image-approvers"
}
