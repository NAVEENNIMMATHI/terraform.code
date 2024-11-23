# RStudio rules
resource "azurerm_network_security_rule" "rstudio_ssh_allow" {
  name                        = "rstudio_ssh_allow"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "*"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.rstudionsg.network_security_group_name
}

resource "azurerm_network_security_rule" "rstudio_TCP5432_allow" {
  name                        = "rstudio_TCP5432_allow"
  priority                    = 150
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5432"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.rstudionsg.network_security_group_name
  description                 = "PostgreSQL"
}

resource "azurerm_network_security_rule" "rstudioLicense_Allow_1080" {
  name                         = "rstudioLicense_Allow_1080"
  priority                     = 160
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_ranges      = ["1080", "443"]
  source_address_prefix        = "*"
  destination_address_prefixes = ["104.20.62.85", "104.20.63.85"]
  resource_group_name          = lower(module.applicationrg.resource_group_name)
  network_security_group_name  = module.rstudionsg.network_security_group_name
  description                  = "Rstudio License server at port 1080\nBrandon - Testing for blocking rule to palo. Was 104.20.62.85,104.20.63.85 at destination IP"
}

resource "azurerm_network_security_rule" "rstudio_deny_internet_out" {
  name                        = "rstudio_deny_internet_out"
  priority                    = 200
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.rstudionsg.network_security_group_name
  description                 = "Temp Allow to test license activation"
}

resource "azurerm_network_security_rule" "rstudio_deny_smtp_out" {
  name                        = "rstudio_deny_smtp_out"
  priority                    = 300
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["25", "25025", "2525", "465", "587"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.rstudionsg.network_security_group_name
}

#Gurobi rules
resource "azurerm_network_security_rule" "gurobi_ssh_allow" {
  name                        = "gurobi_ssh_allow"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "*"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.gurobinsg.network_security_group_name
}

resource "azurerm_network_security_rule" "gurobi_TCP53_allow" {
  name                        = "gurobi_TCP53_allow"
  priority                    = 150
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "53"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.gurobinsg.network_security_group_name
  description                 = "MongoDB"
}

resource "azurerm_network_security_rule" "gurobi_deny_smtp_out" {
  name                        = "gurobi_deny_smtp_out"
  priority                    = 300
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["25", "25025", "2525", "465", "587"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.gurobinsg.network_security_group_name
}

#Windows rules
resource "azurerm_network_security_rule" "windows_https_allow" {
  name                         = "windows_https_allow"
  priority                     = 200
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range      = "443"
  source_address_prefix        = "*"
  destination_address_prefix = "*"
  resource_group_name          = lower(module.applicationrg.resource_group_name)
  network_security_group_name  = module.windowsnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "windows_deny_smtp_out" {
  name                        = "windows_deny_smtp_out"
  priority                    = 300
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["25", "25025", "2525", "465", "587"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = lower(module.applicationrg.resource_group_name)
  network_security_group_name = module.windowsnsg.network_security_group_name
}

