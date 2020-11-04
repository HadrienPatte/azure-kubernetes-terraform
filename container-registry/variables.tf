variable name {
  # The name used for the Container Registry needs to be globally unique.
  type        = string
  description = "Name of the container registry."

  validation {
    condition     = can(regex("^\\w+$", var.name))
    error_message = "Alpha numeric characters only are allowed in \"name\"."
  }

  validation {
    condition     = length(var.name) > 4
    error_message = "\"name\" cannot be less than 5 characters."
  }
}

variable location {
  type        = string
  description = "Name of the Azure Region for the container registry. Available values can be found on https://azure.microsoft.com/en-us/global-infrastructure/geographies/"
}

variable tags {
  type        = map(string)
  description = "Tags"
}
