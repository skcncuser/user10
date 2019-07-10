resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "user10VM"
    location              = "koreasouth"
    resource_group_name   = "${azurerm_resource_group.user10_final.name}"
    network_interface_ids = ["${azurerm_network_interface.myterraformnic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "user10OsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "user10vm"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGPRwMAUFiADhVdLQoyjOyNWMxyAxjRRLgnm/zadJmAHm+Icj/7+1lzGgSWRTk9ia0gu5TbI/4Um3QkwBnhzlsEcsEBmoA7q1y9pBPI8KgmdfxIzNOLiZv/ehJQUERElvSeCnApOnTgguC7rc6VRBeWFPjlhRcUyNyQCpKUxE/HKKkZhV4vJBKf80TjOU6j0rXh3a7k0FKtqnyMQZgZqvmS/E0DMGkQXDXct06RhW8BDhImBLxEL/DmepSHDQ09lR9Za41BahY3BfS3Y0ezLmJjefdRjlc+EBb37X0BiNhwqfnPmUuaT+OmLrU48NiGdUKp0rp53xvIfn3UcHslIxl user10@cc-30cbce91-6467bcd76d-zjbhx"
        }
    }
}
