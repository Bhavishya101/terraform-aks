terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.39.0"
    }
   kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
#  susbcription_id = var.subscription
}

