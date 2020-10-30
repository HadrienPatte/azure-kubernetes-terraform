resource azurerm_resource_group terraform_state {
  name     = "rg-${var.name}"
  location = var.location

  tags = var.tags
}

resource azurerm_storage_account terraform_state {
  # name can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long
  name                     = replace(var.name, "/[^a-z0-9]/", "")
  resource_group_name      = azurerm_resource_group.terraform_state.name
  location                 = azurerm_resource_group.terraform_state.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource azurerm_storage_container terraform_state {
  name                  = var.name
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}
