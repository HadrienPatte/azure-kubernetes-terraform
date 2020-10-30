name         = "k8s"
location     = "East US"
vnet_CIDRs   = ["10.0.0.0/16"]
subnet_CIDRs = ["10.0.0.0/20"]
tags = {
  "terraform.managed" = "true"
  "terraform.module"  = "network"
}
