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
  default     = "standard"
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID of the Azure Active Directory."
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Specifies whether protection against purge is enabled for this key vault."
  default     = false
}
  
variable "soft_delete_retention_days" {
  type        = number
  description = "Specifies the soft delete data retention days. It accepts values between 7 and 90."
  default     = 30  
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for this Key Vault"
  default     = false
}

variable "access_policies" {
  type = list(object({
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
  description = "The access policies for the key vault."
  default = [ {
    tenant_id = null
    object_id = null
    key_permissions = []
    secret_permissions = []
    certificate_permissions = []
  } ]
}

variable "network_acls" {
  type = list(object({
    default_action             = string
    bypass                     = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
  description = "The network ACLs for the key vault."
  default = [ {
    default_action = null
    bypass = null
    ip_rules = []
    virtual_network_subnet_ids = []
  } ]
}

variable "contacts" {
  type = list(object({
    name  = string
    email = string
    phone = string
  }))
  description = "The contacts for the key vault."
  default = [ {
    name = null
    email = null
    phone = null
  } ]
}

variable "tags" {
  type = map(string)
  description = "The tags for the key vault."
  default = {}
}