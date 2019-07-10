resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "user10Vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "koreasouth"
    resource_group_name = "${azurerm_resource_group.user10_final.name}"

}
