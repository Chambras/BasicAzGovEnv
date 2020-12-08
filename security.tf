resource "azurerm_network_security_group" "rdpNSG" {
  name                = "${var.suffix}RDPSG"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefixes    = var.sourceIPs
    destination_address_prefix = "VirtualNetwork"
  }

  tags = var.tags
}

resource "azurerm_network_security_group" "sshNSG" {
  name                = "${var.suffix}SSHSG"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes    = var.sourceIPs
    destination_address_prefix = "VirtualNetwork"
  }

  tags = var.tags
}

resource "azurerm_network_security_group" "dataBricksNSG" {
  name                = "DataBricksSecurityGroup"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name

  tags = var.tags
}
