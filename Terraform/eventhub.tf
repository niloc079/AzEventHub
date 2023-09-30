#
#
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  name 		          = "${var.environment}${var.application}${var.iteration}-evh-nsp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags     	          = var.tags
  sku                 = "Standard"
  capacity            = 1
}

resource "azurerm_eventhub" "eventhub" {
  name 		          = "${var.environment}${var.application}${var.iteration}-evh"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  resource_group_name = azurerm_resource_group.rg.name
  partition_count     = 2
  message_retention   = 7
}
