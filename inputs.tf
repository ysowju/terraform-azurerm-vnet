variable "resource_group_name" {
    type = string
    description = "resource group name"
    default = "rg01"
}

variable "resource_group_location" {
    type = string
    description = "resource group location"
    default = "uksouth"
}

variable "virtual_network_name" {
    type = string
    description = "virtual network name"
    default = "vnet01"

}

variable "vnet_addr" {
    type = list(string)
    description = "address space"
    default = ["10.10.0.0/16"]
}

variable "subnet_names" {
    type = list(string)
    description = "subnet names"
    default = [ "Intranet", "Management","HR", "Identity" ]
  
}

variable "subnet_addr" {
    type = list(string)
    description = "subnet addr"
    default = [ "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24","10.10.4.0/24" ]
  
}

