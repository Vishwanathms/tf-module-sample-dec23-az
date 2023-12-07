provider "azurerm" {
      features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "NetworkWatcherRG"
    storage_account_name = "vishwadec2023cts"
    container_name       = "allstatefiles"
    key                  = "dev.terraform.tfstate"
  }
}


module "sub1" {
    #source = "./modules-1/VM-01/sub1"
    #source = "https://github.com/hashicorp/terraform-provider-azurerm"
    source = "git@github.com:Vishwanathms/tf-priv-modules-dec23.git//subnet"    
    subnet_name = "sub1-dev"
    subnet_CIDR = "10.0.1.0/24"
    rg_name = "rg01"
    vnet-name = "vnet02"
}

/*module "VM-01" {
    #source = "./modules-1/VM-01/vm-template"
    source = "git@github.com:Vishwanathms/tf-priv-modules-dec23.git//vm-template"
    rg_name = "rg01-b1"
    nic_name = "nic1"
    tag_env = "Dev"
    vm_name = "VM01"
    vm_size = "Standard_DS1_v2"
    os_disk_name = "myosdisk1"
    computer_name  = "hostname"
    admin_username = var.admin_username
    vm_pwd = var.vm_pwd
    region = "East US"  
    subnet_id = module.sub1.sub_id 
}*/
