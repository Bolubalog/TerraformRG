resource "azurerm_resource_group" "resource_gp" {
    name = "TerraformRG"
    location = "eastus"

    tags = {
        owner = "Boluwatife"
    }
}


resource "azurerm_virtual_network" "resource_gp" {
  name                = "TerraformVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.resource_gp.location
  resource_group_name = azurerm_resource_group.resource_gp.name
}

resource "azurerm_subnet" "resource_gp" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.resource_gp.name
  virtual_network_name = azurerm_virtual_network.resource_gp.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "resource_gp" {
  name                = "default-nic"
  location            = azurerm_resource_group.resource_gp.location
  resource_group_name = azurerm_resource_group.resource_gp.name

  ip_configuration {
    name                          = "default"
    subnet_id                     = azurerm_subnet.resource_gp.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "resource_gp" {
  name                = "T-machine"
  resource_group_name = azurerm_resource_group.resource_gp.name
  location            = azurerm_resource_group.resource_gp.location
  size                = "Standard_F2"
  admin_username      = "Boluwatife"
  admin_password      = "Bolu@12345"
  network_interface_ids = [
    azurerm_network_interface.resource_gp.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = {
        owner = "Boluwatife"
    }
}
