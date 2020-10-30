variable name {
  type        = string
  description = "Name of the container where terraform state will be stored."
}

variable location {
  type        = string
  description = "Name of the Azure Region where terraform state will be stored. Available values can be found on https://azure.microsoft.com/en-us/global-infrastructure/geographies/"
}

variable tags {
  type        = map(string)
  description = "Tags"
}
