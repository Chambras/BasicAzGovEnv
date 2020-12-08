variable "location" {
  type        = string
  default     = "usgovvirginia"
  description = "Location where the resoruces are going to be created."
}

variable "suffix" {
  type        = string
  default     = "Demo"
  description = "To be added at the beginning of each resource."
}

variable "rgName" {
  type        = string
  default     = "genericGovernmentRG"
  description = "Resource Group Name."
}

variable "tags" {
  type = map(any)
  default = {
    "Environment" = "Development"
    "Project"     = "Test GitHub Actions"
    "BillingCode" = "Internal"
    "Customer"    = "Demo"
  }
}
