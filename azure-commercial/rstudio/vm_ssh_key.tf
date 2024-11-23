resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "azurerm_key_vault_secret" "ssh_key_private" {
  name         = "ssh-key-private-key-pem"
  value        = tls_private_key.ssh_key.private_key_pem
  key_vault_id = azurerm_key_vault.rstudio_key_vault_local.id
}

data "azurerm_key_vault_secret" "rstu_private_key" {
  name         = "rstu-private-key"
  key_vault_id = azurerm_key_vault.rstudio_key_vault_local.id
}
