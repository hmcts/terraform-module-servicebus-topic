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

  enable_partitioning                     = var.enable_partitioning
  default_message_ttl                     = var.default_message_ttl
  max_size_in_megabytes                   = var.max_size_in_megabytes
  requires_duplicate_detection            = var.requires_duplicate_detection
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  enable_batched_operations               = var.enable_batched_operations
  support_ordering                        = var.support_ordering
  auto_delete_on_idle                     = var.auto_delete_on_idle
  enable_express                          = var.enable_express
  max_message_size_in_kilobytes           = var.max_message_size_in_kilobytes
}

resource "azurerm_servicebus_topic_authorization_rule" "send_listen_auth_rule" {
  name     = local.auth_rule_name
  topic_id = azurerm_servicebus_topic.servicebus_topic.id

  listen = true
  send   = true
}
