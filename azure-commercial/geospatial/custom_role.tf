resource "azurerm_role_definition" "limited_network_role" {
  name        = "limited-network-contributor-${var.application_acronym}${var.separator}${var.environment_acronym}"
  scope       = data.azurerm_subscription.current.id
  description = "This is a custom role created to limit/modify the capabilities of a network contributor."

  permissions {
    actions     = [
                  "Microsoft.Network/virtualNetworks/subnets/join/action",
                  "Microsoft.Network/virtualNetworks/subnets/read",
                  "Microsoft.Network/virtualNetworks/subnets/write",
                  "Microsoft.Network/publicIPAddresses/join/action",
                  "Microsoft.Network/publicIPAddresses/read",
                  "Microsoft.Network/publicIPAddresses/write"
                  ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.current.id
  ]
}

resource "azurerm_role_definition" "limited_storage_role" {
  name        = "limited-storage-contributor-${var.application_acronym}${var.separator}${var.environment_acronym}"
  scope       = data.azurerm_subscription.current.id
  description = "This is a custom role created to limit/modify the capabilities of a storage contributor."

  permissions {
    actions     = [
                  "Microsoft.Compute/disks/read",
                  "Microsoft.Compute/disks/write"
                  ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.current.id
  ]
}