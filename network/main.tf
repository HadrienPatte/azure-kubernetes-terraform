resource azurerm_resource_group network {
  name     = "rg-network-${var.name}"
  location = var.location

  tags = var.tags
}

resource azurerm_virtual_network network {
  name                = "vnet-${var.name}"
  address_space       = var.vnet_CIDRs
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location

  tags = var.tags
}

resource azurerm_subnet network {
  name                 = "subnet-${var.name}"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = var.subnet_CIDRs
}

resource azurerm_network_security_group network {
  name                = "nsg-${var.name}"
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_virtual_network.network.location

  tags = var.tags
}

resource azurerm_subnet_network_security_group_association network {
  subnet_id                 = azurerm_subnet.network.id
  network_security_group_id = azurerm_network_security_group.network.id
}
