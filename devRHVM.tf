resource "azurerm_public_ip" "devRHPublicIP" {
  name                = "${var.suffix}${var.devRHVMName}${var.devRHPublicIPName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name
  allocation_method   = var.devRHPublicIPAllocation

  tags = var.tags
}

resource "azurerm_network_interface" "devRHNI" {
  name                = "${var.suffix}${var.devRHVMName}${var.devRHNIName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  ip_configuration {
    name                          = "${var.suffix}${var.devRHVMName}IPConf"
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devRHPublicIP.id
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "devRHSG" {
  network_interface_id      = azurerm_network_interface.devRHNI.id
  network_security_group_id = azurerm_network_security_group.sshNSG.id
}

resource "azurerm_linux_virtual_machine" "mainDevVM" {
  name                = "${var.suffix}${var.devRHVMName}"
  resource_group_name = azurerm_resource_group.genericRG.name
  location            = azurerm_resource_group.genericRG.location
  size                = var.devRHVMSize
  admin_username      = var.devRHUserName
  network_interface_ids = [
    azurerm_network_interface.devRHNI.id,
  ]

  admin_ssh_key {
    username = var.devRHUserName
    # public_key = file(var.devRHsshKeyPath)
    public_key = var.devRHPublicKey
  }

  os_disk {
    name                 = "${var.suffix}${var.devRHVMName}OSDisk"
    caching              = "ReadWrite"
    storage_account_type = var.devRHosDisk
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = var.devRHVMsku
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.genericSA.primary_blob_endpoint
  }

  tags = var.tags
}
