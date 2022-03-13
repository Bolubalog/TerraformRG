provider "azurerm" {
    subscription_id = "${var.subscription_id}"
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
    tenant_id = "${var.tenant_id}"
    features {}
}

variable "subscription_id" {
    description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
description = "Enter client ID for Application creted in Azure AD"
}

variable "client_secret" {
description = "Enter client IsecretD for Application in Azure AD"
}

variable "tenant_id" {
description = "Enter tenant ID of your Azure AD"
}
