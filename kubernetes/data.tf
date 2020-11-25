data azurerm_subnet network {
  name                 = "subnet-${var.network_name}"
  virtual_network_name = "vnet-${var.network_name}"
  resource_group_name  = "rg-network-${var.network_name}"
}

data azurerm_container_registry acr {
  name                = var.container_registry_name
  resource_group_name = var.container_registry_resource_group
}
