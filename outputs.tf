output "rgName" {
  value = azurerm_resource_group.genericRG.name
}

# Network
output "vNet" {
  value = local.base_cidr_block
}

output "mainSubnet" {
  value = azurerm_subnet.main.address_prefix
}

output "appSubnet" {
  value = azurerm_subnet.app.address_prefix
}

# Windows VM
output "devWinPublicIP" {
  value = azurerm_public_ip.devWinPublicIP.ip_address
}

output "devWinPrivateIP" {
  value = azurerm_network_interface.devWinNI.private_ip_address
}

# RedHat VM
output "devRHPublicIP" {
  value = azurerm_public_ip.devRHPublicIP.ip_address
}

output "devRHPrivateIP" {
  value = azurerm_network_interface.devRHNI.private_ip_address
}

output "sshAccess" {
  description = "Command to ssh into the VM."
  value       = <<SSHCONFIG
  ssh ${var.devRHUserName}@${azurerm_public_ip.devRHPublicIP.ip_address} -i ${trimsuffix(var.devRHsshKeyPath, ".pub")}
  SSHCONFIG
}
