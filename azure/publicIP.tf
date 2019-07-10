resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "user10PublicIP"
    location                     = "koreasouth"
    resource_group_name          = "${azurerm_resource_group.user10_final.name}"
    allocation_method            = "Dynamic"
}
