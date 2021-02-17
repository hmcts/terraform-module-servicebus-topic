locals {
  auth_rule_name = "SendAndListenSharedAccessKey"
}

resource "azurerm_servicebus_topic" "servicebus_topic" {
  name                = var.name
  resource_group_name = var.resource_group_name
  namespace_name      = var.namespace_name

  enable_partitioning                     = false
  default_message_ttl                     = "P10675199DT2H48M5.4775807S"
  max_size_in_megabytes                   = 1024
  requires_duplicate_detection            = false
  duplicate_detection_history_time_window = "PT10M"
  enable_batched_operations               = false
  support_ordering                        = false
  auto_delete_on_idle                     = "P10675199DT2H48M5.4775807S"
  enable_express                          = false
}

resource "azurerm_servicebus_topic_authorization_rule" "SendAndListenSharedAccessKey" {
  name                = local.auth_rule_name
  namespace_name      = var.namespace_name
  topic_name          = azurerm_servicebus_topic.servicebus_topic.name
  resource_group_name = var.resource_group_name

  listen = true
  send   = true
}