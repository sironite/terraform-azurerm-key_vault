# Output for the ID of the Azure Key Vault resource
output "key_vault_id" {
  description = "The ID of the Azure Key Vault resource."
  value       = azurerm_key_vault.this.id
}

# Output for the URI of the Azure Key Vault resource
output "key_vault_uri" {
  description = "The URI of the Azure Key Vault resource."
  value       = azurerm_key_vault.this.vault_uri
}

# Output for the access policies of the Azure Key Vault resource
output "key_vault_access_policies" {
  description = "The access policies of the Azure Key Vault resource."
  value       = azurerm_key_vault.this.access_policy
}

# Output for the network ACLs of the Azure Key Vault resource
output "key_vault_network_acls" {
  description = "The network ACLs of the Azure Key Vault resource."
  value       = azurerm_key_vault.this.network_acls
}

# Output for the contacts of the Azure Key Vault resource
output "key_vault_contacts" {
  description = "The contacts of the Azure Key Vault resource."
  value       = azurerm_key_vault.this.contact
}