variable "name" {
  type        = string
  description = "Azure Service Bus topic name"
}

variable "namespace_name" {
  type        = string
  description = "Azure Service Bus namespace"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group in which the Service Bus topic should exist"
}

variable "partitioning_enabled" {
  type        = bool
  default     = false
  description = "Enable partitioning"
}

variable "default_message_ttl" {
  type        = string
  default     = "P10675199DT2H48M5.4775807S"
  description = "Default message ttl"
}

variable "requires_duplicate_detection" {
  type        = bool
  default     = false
  description = "Requires duplicate detection"
}

variable "duplicate_detection_history_time_window" {
  type        = string
  default     = "PT10M"
  description = "The ISO 8601 timespan duration during which duplicates can be detected"
}

variable "max_size_in_megabytes" {
  type        = number
  default     = 1024
  description = "Size of memory allocated"
}

variable "batched_operations_enabled" {
  type        = bool
  default     = false
  description = "Controls whether server-side batched operations are enabled"
}

variable "support_ordering" {
  type        = bool
  default     = false
  description = "Support ordering"
}

variable "auto_delete_on_idle" {
  type        = string
  default     = "P10675199DT2H48M5.4775807S"
  description = "Auto delete on idle"
}

variable "express_enabled" {
  type        = bool
  default     = false
  description = "Enable express"
}

variable "max_message_size_in_kilobytes" {
  type        = string
  description = "Integer value which controls the maximum size of a message allowed on the topic for Premium SKU"
  default     = null
}

variable "managed_identity_object_id" {
  default     = null
  description = "the object id of the managed identity - can be retrieved with az identity show --name <identity-name>-sandbox-mi -g managed-identities-<env>-rg --subscription DCD-CFTAPPS-<env> --query principalId -o tsv"
}

variable "principal_type" {
  type        = string
  description = "The principal type that the role will be assigned to"
  default     = null
}
