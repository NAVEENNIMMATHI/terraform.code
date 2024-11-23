resource "azurerm_lb" "ilb" {
  name                = "CO-${var.environment}-${var.location}-${var.applicationname}-Palo-ILB"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  location            = "${azurerm_resource_group.transitpalofw.location}"
  sku		      = "Standard"
  frontend_ip_configuration {
    name                 = "CO-${var.environment}-${var.location}-${var.applicationname}-Palo-ILB-FrontEnd"
    private_ip_address   = "${var.ilb_frontend_private_ip_address}"
    private_ip_address_allocation   = "Static"
    subnet_id 		 = "${azurerm_subnet.trusttransit.id}"
  }

  tags = "${var.tags}"

}

resource "azurerm_lb_backend_address_pool" "ilbbap" {
  name                = "${azurerm_availability_set.paloaltofwas.name}"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  loadbalancer_id     = "${azurerm_lb.ilb.id}"
}

resource "azurerm_lb_probe" "ilbprobetcp22" {
  name                = "TCP-22"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  loadbalancer_id     = "${azurerm_lb.ilb.id}"
  protocol            = "Tcp"
  port                = 22
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "ilbrule" {
  name                = "${var.ilbrule_name}"
  resource_group_name = "${azurerm_resource_group.transitpalofw.name}"
  loadbalancer_id     = "${azurerm_lb_backend_address_pool.ilbbap.id}"
  frontend_ip_configuration_name  ="CO-${var.environment}-${var.location}-${var.applicationname}-Palo-ILB-FrontEnd"
  frontend_port       = 0
  backend_port        = 0
  enable_floating_ip  = "true"
  idle_timeout_in_minutes  = "30"
  protocol            = "All"
  load_distribution   = "SourceIP"
  backend_address_pool_id  = "${azurerm_lb_backend_address_pool.ilbbap.id}"
  probe_id            = "${azurerm_lb_probe.ilbprobetcp22.id}"
}


