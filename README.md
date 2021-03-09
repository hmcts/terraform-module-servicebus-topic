# terraform-module-servicebus-topic

A Terraform module for creating Azure Service Bus topic
Refer to the following link for a detailed explanation of the Azure Service Bus topic.

[Azure Service Bus Topic](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-queues-topics-subscriptions)

## Usage

The following example shows how to use the module to create an Azure Service Bus topic. 

```terraform
module "servicebus-topic" {
  source                = "git@github.com:hmcts/terraform-module-servicebus-topic?ref=servicebus_topic_tf"
  name                  = "your-topic"
  namespace_name        = module.servicebus-namespace.name
  resource_group_name   = local.resource_group_name
}
```

## Variables

### Configuration

The following parameters are required by this module

- `name` the name of the ServiceBus namespace.
- `resource_group_name` the name of the resource group in which to create the ServiceBus namespace.
- `namespace_name` the name of the service bus namespace in which the topic must be created.

### Output

The following variables are provided by the module for use in other modules

- `name` the name of the service bus topic.
- `primary_send_and_listen_connection_string` the Primary Connection String for the ServiceBus Topic authorization Rule.
- `secondary_send_and_listen_connection_string` the Secondary Connection String for the ServiceBus Topic authorization Rule.
- `primary_send_and_listen_shared_access_key` the Primary Key for the ServiceBus Topic authorization Rule.
- `secondary_send_and_listen_shared_access_key` the Secondary Key for the ServiceBus Topic authorization Rule.
