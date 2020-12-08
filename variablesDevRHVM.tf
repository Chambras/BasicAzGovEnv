variable "devRHUserName" {
  type        = string
  default     = "demoAdmin"
  description = "Username to be added to the VM."
}

variable "devRHsshKeyPath" {
  type        = string
  default     = "~/.ssh/vm_ssh.pub"
  description = "SSH Key path to use when creating the VM."
  #sensitive   = true
}

variable "devRHPublicKey" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRSvh/mi3dOsMRJA0wHB77x+LbFYzTFXc8b2LYeSAMqa06dYC8p9YpmM36dlZ353x8/cDsUEMoiCRUmWuiTEbUHZXvKaBdZiNqdPEed7+05KNWn8WsbKS7PSgAPOIvhS2Cq9WA0hHsxm+GA6bzT4AYMkdSbg4E6Xsisn8f9lT+vJRNmfX+pO4ziIqmX+QM1SmJR5uyiZcSKijIba5qfG1aT6Hxxl7IHjQowtFIevH65krHS0USHqxKwe3Qi5fY+LZC29RW8M6b6UpPICcPdzEtWdrJ2ZdKKtXIK+rL0pZFjqBO1WISweuHnsN58axNUQmSqZkAqjRWBAalpewnWzcTTOjjHUYyiVy2R9QgU+oULunVYZ31/B9uIcmpPyno0D9jMnILK14mUXAfmTPBiiSC25Hsd5jy+x02tj1CNfvddAqrwzbtgsa/nR3mKvXozRGsHf5Y2LG+n3OLITEdAjY0bjAPfvATbwmk9cXx4HDOeGe2EOXTr0ZGU5NTHYnWydgMtNqCeL+10MYYT2NbyZTQ4cu0F9xLdj1sIqjQIWubTocsprec6Zb7PZCTjhwXTDxJcTMAOs+qi4/T4zXlzDvrLAjBTmE91yUPPrt7B0ZVvI+X/G42eahprGO5G0vD1fRfg9KgucZgBZ3WDvuZWHveZVYdo4kTLoj1L72DfiE6TQ== NOTAREALKEY"
  description = "SSH key to use when creating the VM."
  sensitive   = true
}

variable "devRHPublicIPName" {
  type        = string
  default     = "PublicIP"
  description = "Default Public IP name."
}

variable "devRHPublicIPAllocation" {
  type        = string
  default     = "Static"
  description = "Default Public IP allocation. Could be Static or Dynamic."
}

variable "devRHNIName" {
  type        = string
  default     = "NIC"
  description = "Default RedHat Network Interface Name."
}

variable "devRHVMsku" {
  type        = string
  default     = "7-RAW-CI"
  description = "VM OS version to be used."
}

variable "devRHVMName" {
  type        = string
  default     = "DevRH"
  description = "Default JumpBox VM server name."
}

variable "devRHVMSize" {
  type        = string
  default     = "Standard_E2s_v3"
  description = "VM size."
}

variable "devRHosDisk" {
  type        = string
  default     = "StandardSSD_LRS"
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS"
}








