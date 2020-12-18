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

variable "enable_partitioning" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether to enable the topic to be partitioned across multiple message brokers."
}

variable "default_message_ttl" {
  type        = string
  default     = "P10675199DT2H48M5.4775807S"
  description = "The ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself."
}

variable "max_size_in_megabytes" {
  type        = number
  default     = 1024
  description = "Size of memory allocated for the topic"
}

variable "requires_duplicate_detection" {
  type        = bool
  default     = false
  description = "Controls whether the Topic requires duplicate detection"
}

variable "duplicate_detection_history_time_window" {
  type        = string
  default     = "PT10M"
  description = "The ISO 8601 timespan duration during which duplicates can be detected"
}

variable "enable_batched_operations" {
  type        = bool
  default     = false
  description = "Boolean flag which controls if server-side batched operations are enabled"
}

variable "support_ordering" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether the Topic supports ordering"
}

variable "auto_delete_on_idle" {
  type        = string
  default     = "P10675199DT2H48M5.4775807S"
  description = "The ISO 8601 timespan duration of the idle interval after which the Topic is automatically deleted, minimum of 5 minutes"
}

variable "enable_express" {
  type        = bool
  default     = false
  description = "Boolean flag which controls whether Express Entities are enabled"
}