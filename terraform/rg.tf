resource "azurerm_resource_group" "this" {
  name     = "rg-ew-dev"
  location = var.location
  tags     = local.tags
}
