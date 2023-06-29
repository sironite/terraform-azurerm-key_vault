resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tenant_id           = var.tenant_id

  purge_protection_enabled = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days
  public_network_access_enabled = var.public_network_access_enabled

dynamic "access_policy" {
  for_each = var.access_policies != [] ? var.access_policies : []

  content {
    tenant_id               = access_policy.value.tenant_id
    object_id               = access_policy.value.object_id
    key_permissions         = access_policy.value.key_permissions
    secret_permissions      = access_policy.value.secret_permissions
    certificate_permissions = access_policy.value.certificate_permissions
  }
}

dynamic "network_acls" {
  for_each = var.network_acls != [] ? var.network_acls : []

  content {
    default_action             = network_acls.value.default_action
    bypass                     = network_acls.value.bypass
    ip_rules                   = network_acls.value.ip_rules
    virtual_network_subnet_ids = network_acls.value.virtual_network_subnet_ids
  }
}

dynamic "contact" {
  for_each = var.contacts != [] ? var.contacts : []

  content {
    name  = contact.value.name
    email = contact.value.email
    phone = contact.value.phone
  }
}

  tags = var.tags
}

