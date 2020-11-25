name                              = "cluster"
location                          = "East US"
network_name                      = "k8s"
authorized_ip_ranges              = ["0.0.0.0/0"]
vm_size                           = "Standard_D2_v2"
min_count                         = 2
max_count                         = 10
container_registry_name           = "containerregistry"
container_registry_resource_group = "rg-containerregistry"
tags = {
  "terraform.managed" = "true"
  "terraform.module"  = "kubernetes"
}
