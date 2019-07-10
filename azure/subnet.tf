resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "user10Subnet1"
    resource_group_name  = "${azurerm_resource_group.user10_final.name}"
    virtual_network_name = "${azurerm_virtual_network.myterraformnetwork.name}"
    address_prefix       = "10.0.1.0/24"
}
