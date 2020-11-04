# Azure Kubernetes Terraform Example

This repository is an example of how to deploy an AKS cluster (Azure Kubernetes Service) on Microsoft Azure with [Terraform](https://www.terraform.io/).

There are multiple modules that should be applied in the following order:
*
* [`state`](../state): creates a container to store terraform state
* [`network`](../network): creates the network for the cluster
* [`container-registry`](../container-registry): creates the container registry for the cluster
* [`kubernetes`](../kubernetes): creates the cluster

To apply a module, go to its directory, edit the variables file `variables.auto.tfvars` if necessary then initialize and apply terraform with:
```sh
terraform init
terraform apply
```

You will be prompted for confirmation to apply.

To get the kubeconfig to interact with the cluster, from the `kubernetes` directory, run:
```sh
terraform output kube_config >> kubeconfig.yaml
```
