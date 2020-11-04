terraform {
  required_version = "=0.13.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.34.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "=3.0.0"
    }
  }
}
