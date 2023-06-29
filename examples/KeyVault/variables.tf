variable "key_vault_name" {
  type        = string
  description = "The name of the key vault."
}

variable "location" {
  type        = string
  description = "The location of the key vault."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "sku_name" {
  type        = string
  description = "The SKU name of the key vault."
  default = "standard"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the Azure Active Directory."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is enabled."
  default = false
}

variable "soft_delete_enabled" {
  type        = bool
  description = "Whether or not soft delete is enabled."
  default = true
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Whether or not purge protection is enabled."
  default = true
}

variable "access_policies" {
  type        = list(object({
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
  description = "The access policies for the key vault."
}

variable "network_acls" {
  type        = list(object({
    default_action             = string
    bypass                     = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
  description = "The network ACLs for the key vault."
}

variable "contacts" {
  type        = list(object({
    name  = string
    email = string
    phone = string
  }))
  description = "The contacts for the key vault."
}