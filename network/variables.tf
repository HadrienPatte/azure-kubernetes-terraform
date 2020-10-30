variable name {
  type        = string
  description = "Name of the network resources."
}

variable location {
  type        = string
  description = "Name of the Azure Region for the network. Available values can be found on https://azure.microsoft.com/en-us/global-infrastructure/geographies/"
}

variable vnet_CIDRs {
  type        = list(string)
  description = "The address space that is used the virtual network."
}

variable subnet_CIDRs {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
}

variable tags {
  type        = map(string)
  description = "Tags"
}
