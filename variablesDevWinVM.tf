## VMs
variable "devWinUserName" {
  type        = string
  default     = "demoAdmin"
  description = "Username to be added to the VM."
}

variable "windowsPassword" {
  type        = string
  default     = "DoNotStorePasswordsHere!!"
  description = "Windows password to use when creating the VM. It is not recommend to store these values here."
  sensitive   = true
}

variable "devWinPublicIPName" {
  type        = string
  default     = "PublicIP"
  description = "Default Public IP name."
}

variable "devWinPublicIPAllocation" {
  type        = string
  default     = "Static"
  description = "Default Public IP allocation. Could be Static or Dynamic."
}

variable "devWinNIName" {
  type        = string
  default     = "NIC"
  description = "Default Windows Network Interface Name."
}

variable "devWinVMSKU" {
  type        = string
  default     = "2019-Datacenter"
  description = "Default VM SKU to be used in the VMS."
}

### Dev
variable "devWinVMName" {
  type        = string
  default     = "DevWin"
  description = "Default VM server name."
}

variable "devWinVMSize" {
  type        = string
  default     = "Standard_DS2_v2"
  description = "Default VM size."
}

variable "devWinosDisk" {
  type        = string
  default     = "StandardSSD_LRS"
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
}
