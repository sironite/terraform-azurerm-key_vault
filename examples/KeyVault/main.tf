module "key_vault" {
  source  = "sironite/key_vault/azurerm"
  version = "X.X.X"

  key_vault_name           = "key-vault"
  resource_group_name      = "resource-group"
  location                 = "westeurope"
  sku_name                 = "standard"
  tenant_id                = data.azurerm_client_config.current.tenant_id

  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days
  public_network_access_enabled = var.public_network_access_enabled
  
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
    }
  }
}