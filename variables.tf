variable "name" {
  type = "string"
  description = "Azure Service Bus topic name"
}

variable "namespace_name" {
  type = "string"
  description = "Azure Service Bus namespace"
}

variable "resource_group_name" {
  type = "string"
  description = "Resource group in which the Service Bus topic should exist"
}
