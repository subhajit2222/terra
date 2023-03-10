Main.tf


resource "azurerm_resource_group" "example"{
name =var.resource_group_name
location =var.resource_group_location
}
resource "azurerm_virtual_network" "example" {
  name                = var.azurerm_virtual_network_name
  address_space       = var.address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers
}
resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.address_prefix
}
resource "azurerm_network_interface" "example" {
  name                = var.azurerm_network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          =  var.nic_name
    subnet_id                     =  azurerm_subnet.example.id
    private_ip_address_allocation =  "Dynamic"
  }
}

  resource "azurerm_virtual_machine" "example" {
  name                  = var.azure_vmname
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = var.vm_size
 storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "sysadmin"
    admin_password = "Password123#"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
  } 
