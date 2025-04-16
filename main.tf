locals {
  auth_rule_name = "SendAndListenSharedAccessKey"
}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_servicebus_namespace" "this" {
  name                = var.namespace_name
  resource_group_name = var.resource_group_name
}


resource "azurerm_servicebus_topic" "servicebus_topic" {
  name         = var.name
  namespace_id = data.azurerm_servicebus_namespace.this.id

  partitioning_enabled                    = var.partitioning_enabled
  default_message_ttl                     = var.default_message_ttl
  max_size_in_megabytes                   = var.max_size_in_megabytes
  requires_duplicate_detection            = var.requires_duplicate_detection
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  batched_operations_enabled              = var.batched_operations_enabled
  support_ordering                        = var.support_ordering
  auto_delete_on_idle                     = var.auto_delete_on_idle
  express_enabled                         = var.express_enabled
  max_message_size_in_kilobytes           = var.max_message_size_in_kilobytes
}

resource "azurerm_servicebus_topic_authorization_rule" "send_listen_auth_rule" {
  name     = local.auth_rule_name
  topic_id = azurerm_servicebus_topic.servicebus_topic.id

  listen = true
  send   = true
}
