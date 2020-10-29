resource azurerm_resource_group terraform_state {
  name     = "rg-${var.name}"
  location = var.location
}

resource azurerm_storage_account terraform_state {
  name                     = "st-${var.name}"
  resource_group_name      = azurerm_resource_group.terraform_state.name
  location                 = azurerm_resource_group.terraform_state.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource azurerm_storage_container terraform_state {
  name                  = var.name
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}
