# Terraform module | AzureRM -  Key Vault

This Terraform module is designed to create a  Key Vault for Azure.

## Pre-requisites

Using the modules requires the following pre-requisites:
 * Active Azure account and subscription 

## Usage

`key_vault`

```hcl
module "key_vault" {
  source  = "sironite/key_vault/azurerm"
  version = "X.X.X"
}

```

## Authors

The module is maintained by [Sironite](https://github.com/sironite)

## Documentation

> product: https://azure.microsoft.com/en-us/
> 
> Provider: https://registry.terraform.io/providers/hashicorp/azurerm/latest
> 
> Documentation: https://learn.microsoft.com/en-us/azure/?product=popular
