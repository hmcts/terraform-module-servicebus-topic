locals {
  managed_identity_list = toset(compact(concat(var.managed_identity_object_ids, [var.managed_identity_object_id])))
}

resource "azurerm_role_assignment" "mi_role_assignment_sender" {
  principal_id         = each.value
  role_definition_name = "Azure Service Bus Data Sender"
  scope                = azurerm_servicebus_topic.servicebus_topic.id
  for_each             = local.managed_identity_list
}
