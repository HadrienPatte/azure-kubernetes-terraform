# State

This terraform module manages the Azure Storage Container that will be used to store Terraform state files. For bootstrapping reasons, this module has no remote backend configuration and relies on a local statefile that is commited.
