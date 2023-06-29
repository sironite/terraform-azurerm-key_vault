<!-- BEGIN_TF_DOCS -->
 # Key Vault
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](https://github.com/sironite/terraform-azurerm-key_vault/releases/latest) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault)

# Usage - Module

## Key Vault
```hcl
module "key_vault" {
  source  = "sironite/key_vault/azurerm"
  version = "X.X.X"

  name                     = "key-vault"
  resource_group_name      = "resource-group"
  location                 = "westeurope"
  sku_name                 = "standard"
  tenant_id                = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled      = true
  purge_protection_enabled = true
  purge_protection_days    = 90

  access_policies = {
    "access-policy-1" = {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azurerm_client_config.current.object_id
      key_permissions         = ["get", "list", "create", "delete", "recover", "backup", "restore", "encrypt", "decrypt", "unwrapKey", "wrapKey", "sign", "verify", "purge"]
      secret_permissions      = ["get", "list", "set", "delete", "recover", "backup", "restore", "purge"]
      certificate_permissions = ["get", "list", "delete", "create", "import", "update", "managecontacts", "getissuers", "listissuers", "setissuers", "deleteissuers", "manageissuers", "recover", "purge"]
    }
  }

  contacts = {
    "contact-1" = {
      name  = "contact-1"
      email = "example@github.com"
      phone = "123456789"
    }
  }

  network_acls = {
    "network-acls-1" = {
      default_action             = "Deny"
      bypass                     = "AzureServices"
      ip_rules                   = [""]
      virtual_network_subnet_ids = module.network.subnet_ids
  } }




}
```

## Providers

| Name | Version |
|------|---------|
| azurerm | >=2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| access\_policies | The access policies for the key vault. | <pre>list(object({<br>    tenant_id               = string<br>    object_id               = string<br>    key_permissions         = list(string)<br>    secret_permissions      = list(string)<br>    certificate_permissions = list(string)<br>  }))</pre> | yes |
| contacts | The contacts for the key vault. | <pre>list(object({<br>    name  = string<br>    email = string<br>    phone = string<br>  }))</pre> | yes |
| key\_vault\_name | The name of the key vault. | `string` | yes |
| location | The location of the key vault. | `string` | yes |
| network\_acls | The network ACLs for the key vault. | <pre>list(object({<br>    default_action             = string<br>    bypass                     = string<br>    ip_rules                   = list(string)<br>    virtual_network_subnet_ids = list(string)<br>  }))</pre> | yes |
| resource\_group\_name | The name of the resource group. | `string` | yes |
| tenant\_id | The tenant ID of the Azure Active Directory. | `string` | yes |
| public\_network\_access\_enabled | Whether or not public network access is enabled. | `bool` | no |
| purge\_protection\_enabled | Whether or not purge protection is enabled. | `bool` | no |
| sku\_name | The SKU name of the key vault. | `string` | no |
| soft\_delete\_enabled | Whether or not soft delete is enabled. | `bool` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_access\_policies | The access policies of the Azure Key Vault resource. |
| key\_vault\_contacts | The contacts of the Azure Key Vault resource. |
| key\_vault\_id | The ID of the Azure Key Vault resource. |
| key\_vault\_network\_acls | The network ACLs of the Azure Key Vault resource. |
| key\_vault\_uri | The URI of the Azure Key Vault resource. |

## Related documentation
<!-- END_TF_DOCS -->