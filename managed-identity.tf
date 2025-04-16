
resource "azurerm_role_assignment" "mi_role_assignment_sender" {
  principal_id         = var.managed_identity_object_id
  role_definition_name = "Azure Service Bus Data Sender"
  scope                = azurerm_servicebus_topic.servicebus_topic.id
  principal_type       = var.principal_type

  count = var.managed_identity_object_id != null ? 1 : 0
}
