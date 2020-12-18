# terraform-module-servicebus-topic

A Terraform module for creating Azure Service Bus topics
Refer to the following link for a detailed explanation of the Azure Service Bus topic.

[Azure Service Bus Topic](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-queues-topics-subscriptions) <br />

## Usage

The following example shows how to use the module to create an Azure Service Bus topic. 

```terraform
module "servicebus-topic" {
  source                = "git@github.com:hmcts/terraform-module-servicebus-topic?ref=servicebus_topic_tf"
  name                  = local.topic_name
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

The following parameters are optional

- `enable_partitioning` whether to enable the topic to be partitioned across multiple message brokers (true or false).
- `default_message_ttl` the ISO 8601 timespan duration of TTL of messages sent to this topic if no TTL value is set on the message itself.
- `max_size_in_megabytes` controls the size of memory allocated for the topic.
- `requires_duplicate_detection` whether the Topic requires duplicate detection (true or false).
- `duplicate_detection_history_time_window` The ISO 8601 timespan duration during which duplicates can be detected.
- `enable_batched_operations` whether server-side batched operations are enabled (true or false).
- `support_ordering` whether the Topic supports ordering (true or false).
- `auto_delete_on_idle` The ISO 8601 timespan duration of the idle interval after which the Topic is automatically deleted.
- `enable_express` whether Express Entities are enabled (true or false).

### Output

The following variables are provided by the module for use in other modules

- `name` the name of the service bus topic.
- `primary_send_and_listen_connection_string` the Primary Connection String for the ServiceBus Topic authorization Rule.
- `secondary_send_and_listen_connection_string` the Secondary Connection String for the ServiceBus Topic authorization Rule.
- `primary_send_and_listen_shared_access_key` the Primary Key for the ServiceBus Topic authorization Rule.
- `secondary_send_and_listen_shared_access_key` the Secondary Key for the ServiceBus Topic authorization Rule.