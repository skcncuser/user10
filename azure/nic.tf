resource "azurerm_network_interface" "myterraformnic" {
    name                = "user10NIC"
    location            = "koreasouth"
    resource_group_name = "${azurerm_resource_group.user10_final.name}"
    network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

    ip_configuration {
        name                          = "user10NicConfiguration"
        subnet_id                     = "${azurerm_subnet.myterraformsubnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.myterraformpublicip.id}"
    }
}
