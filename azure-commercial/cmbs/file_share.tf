resource "azurerm_storage_share" "cmbs_storage_share" {
  name                 = "cmbsazurefunctions"
  storage_account_name =  module.cmbssa.storage_account_name
  quota = 1000

}
