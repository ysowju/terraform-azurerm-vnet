resource "azurerm_resource_group" "RG01" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags = local.tags
}


resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.RG01.location
  resource_group_name = azurerm_resource_group.RG01.name
  address_space       = var.vnet_addr

    tags = local.tags

}

resource "azurerm_subnet" "subnets" {
  count = length(var.subnet_addr)
  name = var.subnet_names[count.index]
  resource_group_name = azurerm_resource_group.RG01.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [var.subnet_addr[count.index]]
  depends_on = [ azurerm_resource_group.RG01, azurerm_virtual_network.vnet ]
}


# resource "azurerm_subnet" "Intranet" {
#   name                 = "Intranet"
#   resource_group_name  = azurerm_resource_group.RG01.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.10.1.0/24"]

#   }

# resource "azurerm_subnet" "Management" {
#   name                 = "Management"
#   resource_group_name  = azurerm_resource_group.RG01.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.10.2.0/24"]
  
#   }

# resource "azurerm_subnet" "HR" {
#   name                 = "HR"
#   resource_group_name  = azurerm_resource_group.RG01.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.10.3.0/24"]

#   }

# resource "azurerm_subnet" "Identity" {
#   name                 = "Identity"
#   resource_group_name  = azurerm_resource_group.RG01.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.10.4.0/24"]

#   depends_on = [ azurerm_virtual_network.vnet ]
#   }

 