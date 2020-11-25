variable name {
  type        = string
  description = "Name of the AKS cluster."

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9-]*[a-zA-Z0-9]$", var.name))
    error_message = "\"name\" must start with a letter and must end with a letter or a number."
  }

  validation {
    condition     = length(var.name) > 2 && length(var.name) < 46
    error_message = "\"name\" must contain between 3 and 45 characters."
  }
}

variable location {
  type        = string
  description = "Name of the Azure Region where the AKS cluster will be. Available values can be found on https://azure.microsoft.com/en-us/global-infrastructure/geographies/"
}

variable network_name {
  type        = string
  description = "Name of the network resources managed by the `network` module."
}

variable authorized_ip_ranges {
  type        = list(string)
  description = "The IP ranges to whitelist for incoming traffic to the masters."
}

variable vm_size {
  type        = string
  description = "The size of the Virtual Machines of the default Node Pool. Available values can be found on https://docs.microsoft.com/en-us/azure/cloud-services/cloud-services-sizes-specs"
}

variable min_count {
  type        = number
  description = "The minimum number of nodes which should exist in the default Node Pool."

  validation {
    condition     = var.min_count > 0 && var.min_count < 101
    error_message = "\"min_count\" must be between 1 and 100."
  }
}

variable max_count {
  type        = number
  description = "The maximum number of nodes which should exist in the default Node Pool."

  validation {
    condition     = var.max_count > 0 && var.max_count < 101
    error_message = "\"min_count\" must be between 1 and 100."
  }
}

variable container_registry_name {
  type        = string
  description = "Name of the container registry."
}

variable container_registry_resource_group {
  type        = string
  description = "Name of the container registry resource group."
}

variable tags {
  type        = map(string)
  description = "Tags"
}
