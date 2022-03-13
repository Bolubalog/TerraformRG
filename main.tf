resource "azurerm_resource_group" "resource_gp" {
    name = "TerraformRG"
    location = "eastus"

    tags = {
        owner = "Boluwatife"
    }
}