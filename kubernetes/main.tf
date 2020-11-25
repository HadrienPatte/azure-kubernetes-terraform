resource azurerm_resource_group kubernetes {
  name     = "rg-kubernetes-${var.name}"
  location = var.location

  tags = var.tags
}

resource azurerm_kubernetes_cluster kubernetes {
  name                = "aks-${var.name}"
  resource_group_name = azurerm_resource_group.kubernetes.name
  location            = azurerm_resource_group.kubernetes.location
  dns_prefix          = var.name

  api_server_authorized_ip_ranges = var.authorized_ip_ranges

  default_node_pool {
    name                  = var.name
    vm_size               = var.vm_size
    availability_zones    = ["1", "2"]
    enable_auto_scaling   = true
    type                  = "VirtualMachineScaleSets"
    node_count            = var.min_count
    min_count             = var.min_count
    max_count             = var.max_count
    enable_node_public_ip = false
    vnet_subnet_id        = data.azurerm_subnet.network.id

    tags = var.tags
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    # admin_username cannot be "admin"
    admin_username = "kubernetesadmin"
    ssh_key {
      key_data = tls_private_key.kubernetes.public_key_openssh
    }
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "calico"
    outbound_type      = "loadBalancer"
    load_balancer_sku  = "Standard"
    service_cidr       = "10.1.0.0/16"
    dns_service_ip     = "10.1.0.2"
    docker_bridge_cidr = "10.2.0.1/16"
  }

  lifecycle {
    ignore_changes = [default_node_pool[0].node_count]
  }

  tags = var.tags
}

resource tls_private_key kubernetes {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource azurerm_role_assignment aks_acr_pull {
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.kubernetes.kubelet_identity[0].object_id
}
