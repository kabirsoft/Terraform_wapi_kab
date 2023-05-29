provider "azurerm" {   
  features {}
}

terraform {   
  backend "azurerm" {
    resource_group_name = "terraform_resourceGroup_blobstore"
    storage_account_name = "terraformstorageaccdemo"
    container_name = "tfdemostate"
    key = "terraformt.tfstate"
  }  
}

variable "imagebuild" {
  type        = string  
  description = "Latest image build"
}

resource "azurerm_resource_group" "terraform_kab" {
  name = "terraform_rg_kab"
  location = "Norway East"
}

resource "azurerm_container_group" "terraform_cg_kab"{
  name = "weatherapi_kab"
  location = azurerm_resource_group.terraform_kab.location
  resource_group_name = azurerm_resource_group.terraform_kab.name
  ip_address_type = "Public"
  dns_name_label = "terraformWapikab"
  os_type = "Linux"

  container {
    name = "weatherapikab"
    image = "kabsoft/terraform_wapi_kab:${var.imagebuild}"
    cpu = "1"
    memory = "1"

    ports {
      port = 80
      protocol = "TCP"
    }
  }
}