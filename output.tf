output "servicebus_topic" {
  value = "${azurerm_servicebus_topic.topic.name}"
}
