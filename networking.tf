## Create Network
resource "azurerm_virtual_network" "genericVNet" {
  name                = "${var.suffix}-${var.vnetName}"
  location            = azurerm_resource_group.genericRG.location
  resource_group_name = azurerm_resource_group.genericRG.name
  address_space       = [local.base_cidr_block]

  tags = var.tags
}

# Main Subnet for DCs and other utility servers
resource "azurerm_subnet" "main" {
  name                 = "demo-dev-main"
  resource_group_name  = azurerm_resource_group.genericRG.name
  virtual_network_name = azurerm_virtual_network.genericVNet.name
  # address_prefix       = 10.60.0.0/28"
  address_prefixes = [cidrsubnet(local.base_cidr_block, 12, 0)]

  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_subnet" "app" {
  name                 = "demo-dev-app"
  resource_group_name  = azurerm_resource_group.genericRG.name
  virtual_network_name = azurerm_virtual_network.genericVNet.name
  # address_prefix       = "10.60.0.16/28"
  address_prefixes = [cidrsubnet(local.base_cidr_block, 12, 1)]

  service_endpoints = ["Microsoft.Storage"]
}


resource "azurerm_subnet" "dbSubnets" {
  for_each = var.dataBricksSubnets

  name                 = each.key
  resource_group_name  = azurerm_resource_group.genericRG.name
  virtual_network_name = azurerm_virtual_network.genericVNet.name
  address_prefixes     = [cidrsubnet(local.base_cidr_block, 8, each.value)]

  service_endpoints = ["Microsoft.Storage"]

  delegation {
    name = "dataBricksDelegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "dataBricksNSGAssociation" {
  for_each                  = var.dataBricksSubnets
  subnet_id                 = azurerm_subnet.dbSubnets[each.key].id
  network_security_group_id = azurerm_network_security_group.dataBricksNSG.id
}
