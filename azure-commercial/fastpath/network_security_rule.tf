#app NSG Rules
resource "azurerm_network_security_rule" "Port_443" {
  name                        = "Port_443"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"  
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.appnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Port_All" {
  name                        = "Port_All"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"  
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.app_subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.appnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "Port_ASE" {
  name                        = "Port_ASE"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"  
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = var.ase_subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.appnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "OutBound443" {
  name                        = "OutBound443"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"  
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.appnsg.network_security_group_name
}

#redis NSG Rules
resource "azurerm_network_security_rule" "alb_to_redis_tcp" {
  name                        = "inbound_allow_alb-to-redis"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allowing incoming traffic from ALB to redis on different ports."
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["6379-6380", "8500", "10221-10231", "13000-13999", "15000-15999", "16001"]
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = var.redis_subnet_address_prefix
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "redis_to_redis_tcp" {
  name                        = "inbound_allow_redis-to-redis"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allowing incoming traffic from redis to redis on different ports."
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["6379-6380", "8443", "10221-10231", "20226"]
  source_address_prefix       = var.redis_subnet_address_prefix
  destination_address_prefix  = var.redis_subnet_address_prefix
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "virtualnetwork_to_redis_tcp" {
  name                        = "inbound_allow_virtualnetwork-to-redis"
  priority                    = 115
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allowing incoming traffic from Virtual Network to redis on different ports."
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["6379-6380", "13000-13999", "15000-15999"]
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = var.redis_subnet_address_prefix
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "alb_to_redis_tcp_udp" {
  name                        = "inbound_allow_udp_alb_to_redis"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  description                 = "Allow UDP port from redis to virtual network"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_ranges     = ["8500", "16001"]
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = var.redis_subnet_address_prefix
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "redis_to_all" {
  name                        = "outbound_allow_redis-to-all"
  priority                    = 105
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Redis dependencies on Azure Storage/PKI (Internet)"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443"]
  source_address_prefix       = var.redis_subnet_address_prefix
  destination_address_prefix  = "*"
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "redis_to_keyvault" {
  name                        = "outbound_allow_redis-to-keyvault"
  priority                    = 110
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Redis dependency on Azure Key Vault"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["443"]
  source_address_prefix       = var.redis_subnet_address_prefix
  destination_address_prefix  = "AzureKeyVault"
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "redis_to_dns" {
  name                         = "outbound_allow_redis-to-dns"
  priority                     = 115
  direction                    = "Outbound"
  access                       = "Allow"
  description                  = "Redis dependencies on DNS (Internet/VNet)"
  protocol                     = "Tcp"
  source_port_range            = "*"
  destination_port_ranges      = ["53"]
  source_address_prefix        = var.redis_subnet_address_prefix
  destination_address_prefixes = ["168.63.129.16", "169.254.169.254"]
  resource_group_name          = module.apprg.resource_group_name
  network_security_group_name  = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "redis_to_dns_udp" {
  name                         = "outbound_allow_redis-to-dns_udp"
  priority                     = 120
  direction                    = "Outbound"
  access                       = "Allow"
  description                  = "Redis dependencies on DNS (Internet/VNet)"
  protocol                     = "Udp"
  source_port_range            = "*"
  destination_port_ranges      = ["53"]
  source_address_prefix        = var.redis_subnet_address_prefix
  destination_address_prefixes = ["168.63.129.16", "169.254.169.254"]
  resource_group_name          = module.apprg.resource_group_name
  network_security_group_name  = module.redisnsg.network_security_group_name
}

resource "azurerm_network_security_rule" "redis_to_redis" {
  name                        = "outbound_allow_redis-to-redis"
  priority                    = 125
  direction                   = "Outbound"
  access                      = "Allow"
  description                 = "Internal communications for Redis"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["53", "8443", "10221-10231", "20226", "13000-13999", "15000-15999", "6379-6380"]
  source_address_prefix       = var.redis_subnet_address_prefix
  destination_address_prefix  = var.redis_subnet_address_prefix
  resource_group_name         = module.apprg.resource_group_name
  network_security_group_name = module.redisnsg.network_security_group_name
}