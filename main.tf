locals {
  auth_rule_name = "SendAndListenSharedAccessKey"
}

resource "azurerm_servicebus_topic" "servicebus_topic" {
  name                = var.name
  namespace_id        = var.namespace_name

  enable_partitioning                     = var.enable_partitioning
  default_message_ttl                     = var.default_message_ttl
  max_size_in_megabytes                   = var.max_size_in_megabytes
  requires_duplicate_detection            = var.requires_duplicate_detection
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  enable_batched_operations               = var.enable_batched_operations
  support_ordering                        = var.support_ordering
  auto_delete_on_idle                     = var.auto_delete_on_idle
  enable_express                          = var.enable_express
}

resource "azurerm_servicebus_topic_authorization_rule" "send_listen_auth_rule" {
  name                = local.auth_rule_name
  topic_id            = azurerm_servicebus_topic.servicebus_topic.id

  listen = true
  send   = true
}
