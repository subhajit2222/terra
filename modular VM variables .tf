variable "resource_group_name"{
default ="rg2"
}
variable "resource_group_location"{
default = "eastUS2"
}
variable "azurerm_virtual_network_name"{
default="OfficeNet"
}
variable "address_space"{
default = ["172.16.0.0/16"]
}
variable "dns_servers"{
default= ["172.16.0.4", "172.0.0.5"]
}
variable "subnet_name"{
  default= "appSubnet"
  }
variable "address_prefix"{
  default= ["172.16.10.0/24"]
  }
  
variable "azurerm_network_interface_name"{
  default= "aznetint1"
}
variable "nic_name"{
  default= "Testconfig"
}
variable "azure_vmname"{
default= "subhajits"
}
variable "vm_size"{
default = "Standard_B2s"
}
