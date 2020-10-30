resource azurerm_resource_group container_registry {
  name     = "rg-${var.name}"
  location = var.location

  tags = var.tags
}

resource azurerm_container_registry container_registry {
  name                = var.name
  resource_group_name = azurerm_resource_group.container_registry.name
  location            = azurerm_resource_group.container_registry.location
  sku                 = "Standard"
  admin_enabled       = false

  tags = var.tags
}
