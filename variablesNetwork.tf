## Networking variables
variable "vnetName" {
  type        = string
  default     = "Main"
  description = "VNet name."
}

locals {
  base_cidr_block = "10.60.0.0/16"
}

variable "dataBricksSubnets" {
  type = map(any)
  default = {
    "publicDB"  = "2"
    "privateDB" = "3"
  }
  description = " DataBricks dedicated subnets for VNet injection."
}
