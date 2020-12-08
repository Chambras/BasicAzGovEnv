resource "azurerm_resource_group_template_deployment" "databricksWokspace" {
  name                = "${var.suffix}${var.workspaceName}"
  resource_group_name = azurerm_resource_group.genericRG.name

  template_content = file("workspace.json")

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters_content = jsonencode({
    workspaceName     = { value = var.workspaceName }
    vnetName          = { value = azurerm_virtual_network.genericVNet.name }
    privateSubnetName = { value = azurerm_subnet.dbSubnets["privateDB"].name }
    publicSubnetName  = { value = azurerm_subnet.dbSubnets["publicDB"].name }
    location          = { value = azurerm_resource_group.genericRG.location }
    pricingTier       = { value = "trial" }
  })

  deployment_mode = "Incremental"
}
