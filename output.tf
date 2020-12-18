# name of the topic
output "name" {
  value = azurerm_servicebus_topic.servicebus_topic.name
}

# primary connection string for send and listen operations
output "primary_send_and_listen_connection_string" {
  value = azurerm_servicebus_topic_authorization_rule.topic_authorization_rule.primary_connection_string
}

# secondary connection string for send and listen operations
output "secondary_send_and_listen_connection_string" {
  value = azurerm_servicebus_topic_authorization_rule.topic_authorization_rule.secondary_connection_string
}

# primary shared access key with send and listen rights
output "primary_send_and_listen_shared_access_key" {
  value = azurerm_servicebus_topic_authorization_rule.topic_authorization_rule.primary_key
}

# secondary shared access key with send and listen rights
output "secondary_send_and_listen_shared_access_key" {
  value = azurerm_servicebus_topic_authorization_rule.topic_authorization_rule.secondary_key
}