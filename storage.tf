resource "azurerm_storage_account" "genericSA" {
  name                     = var.storageAccountName
  resource_group_name      = azurerm_resource_group.genericRG.name
  location                 = azurerm_resource_group.genericRG.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.tags
}
