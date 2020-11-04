output host {
  value = azurerm_kubernetes_cluster.kubernetes.kube_config.0.host
}

output kube_config {
  value = azurerm_kubernetes_cluster.kubernetes.kube_config_raw
}

output private_ssh_key {
  value = tls_private_key.kubernetes.private_key_pem
}
