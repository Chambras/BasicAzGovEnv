resource "azurerm_public_ip" "devWinPublicIP" {
  name                = "${var.suffix}${var.devWinVMName}${var.devWinPublicIPName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name
  allocation_method   = var.devWinPublicIPAllocation

  tags = var.tags
}

resource "azurerm_network_interface" "devWinNI" {
  name                = "${var.suffix}${var.devWinVMName}${var.devWinNIName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  ip_configuration {
    name                          = "${var.suffix}${var.devWinVMName}IPConf"
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devWinPublicIP.id
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "devWinSG" {
  network_interface_id      = azurerm_network_interface.devWinNI.id
  network_security_group_id = azurerm_network_security_group.rdpNSG.id
}

resource "azurerm_windows_virtual_machine" "devWinVM" {
  name                       = "${var.suffix}${var.devWinVMName}"
  resource_group_name        = azurerm_resource_group.genericRG.name
  location                   = azurerm_resource_group.genericRG.location
  size                       = var.devWinVMSize
  admin_username             = var.devWinUserName
  admin_password             = var.windowsPassword
  encryption_at_host_enabled = false

  network_interface_ids = [azurerm_network_interface.devWinNI.id]

  os_disk {
    name                 = "${var.suffix}${var.devWinVMName}OSDisk"
    caching              = "ReadWrite"
    storage_account_type = var.devWinosDisk
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.devWinVMSKU
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.genericSA.primary_blob_endpoint
  }

  # storage_image_reference {
  #   publisher = "MicrosoftWindowsServer"
  #   offer     = "WindowsServer"
  #   sku       = "2012-R2-Datacenter"
  #   version   = "latest"
  # }

  # storage_os_disk {
  #   name              = "${var.suffix}Windows${var.devWinVMName}OSdisk1"
  #   caching           = "ReadWrite"
  #   create_option     = "FromImage"
  #   managed_disk_type = "Standard_LRS"
  # }

  tags = var.tags
}
