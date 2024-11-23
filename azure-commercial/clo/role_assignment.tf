resource "azurerm_role_assignment" "key_vault2_contributor" {
  count = 1
  scope                = azurerm_key_vault.key_vault2[count.index].id
  role_definition_name = "Contributor"
  #principal_id         = element(azurerm_virtual_machine.cloappvm.identity, count.index)
  principal_id         = azurerm_virtual_machine.cloappvm[count.index].identity.0.principal_id
}
