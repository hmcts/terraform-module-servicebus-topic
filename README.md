# terraform-module-servicebus-topic

A Terraform module for creating Azure Service Bus topic
Refer to the following link for a detailed explanation of the Azure Service Bus topic.

[Azure Service Bus Topic](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-queues-topics-subscriptions)

## Usage

The following example shows how to use the module to create an Azure Service Bus topic. 

```terraform
module "servicebus-topic" {
  source                = "git@github.com:hmcts/terraform-module-servicebus-topic?ref=master"
  name                  = "your-topic"
  namespace_name        = module.servicebus-namespace.name
  resource_group_name   = azurerm_resource_group.rg.name
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

## Managed Identity Role Assignment

The following example shows how to give read access to a user assigned managed identity for the topic:

```terraform
module "servicebus-topic" {
  source                     = "git@github.com:hmcts/terraform-module-servicebus-topic?ref=master"
  name                       = "your-topic"
  namespace_name             = module.servicebus-namespace.name
  resource_group_name        = azurerm_resource_group.rg.name

  # this variable is required
  managed_identity_object_id = "your-mi-object-id"
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_delete_on_idle"></a> [auto\_delete\_on\_idle](#input\_auto\_delete\_on\_idle) | Auto delete on idle | `string` | `"P10675199DT2H48M5.4775807S"` | no |
| <a name="input_default_message_ttl"></a> [default\_message\_ttl](#input\_default\_message\_ttl) | Default message ttl | `string` | `"P10675199DT2H48M5.4775807S"` | no |
| <a name="input_duplicate_detection_history_time_window"></a> [duplicate\_detection\_history\_time\_window](#input\_duplicate\_detection\_history\_time\_window) | The ISO 8601 timespan duration during which duplicates can be detected | `string` | `"PT10M"` | no |
| <a name="input_enable_batched_operations"></a> [enable\_batched\_operations](#input\_enable\_batched\_operations) | Controls whether server-side batched operations are enabled | `bool` | `false` | no |
| <a name="input_enable_express"></a> [enable\_express](#input\_enable\_express) | Enable express | `bool` | `false` | no |
| <a name="input_enable_partitioning"></a> [enable\_partitioning](#input\_enable\_partitioning) | Enable partitioning | `bool` | `false` | no |
| <a name="input_managed_identity_object_id"></a> [managed\_identity\_object\_id](#input\_managed\_identity\_object\_id) | the object id of the managed identity - can be retrieved with az identity show --name <identity-name>-sandbox-mi -g managed-identities-<env>-rg --subscription DCD-CFTAPPS-<env> --query principalId -o tsv | `any` | `null` | no |
| <a name="input_max_message_size_in_kilobytes"></a> [max\_message\_size\_in\_kilobytes](#input\_max\_message\_size\_in\_kilobytes) | Integer value which controls the maximum size of a message allowed on the topic for Premium SKU | `string` | `null` | no |
| <a name="input_max_size_in_megabytes"></a> [max\_size\_in\_megabytes](#input\_max\_size\_in\_megabytes) | Size of memory allocated | `number` | `1024` | no |
| <a name="input_name"></a> [name](#input\_name) | Azure Service Bus topic name | `string` | n/a | yes |
| <a name="input_namespace_id"></a> [namespace\_id](#input\_namespace\_id) | Azure Service Bus namespace resource ID. When use\_namespace\_id is true, used directly for topic namespace\_id. | `string` | `null` | no |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Azure Service Bus namespace | `string` | n/a | yes |
| <a name="input_requires_duplicate_detection"></a> [requires\_duplicate\_detection](#input\_requires\_duplicate\_detection) | Requires duplicate detection | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group in which the Service Bus topic should exist | `string` | n/a | yes |
| <a name="input_support_ordering"></a> [support\_ordering](#input\_support\_ordering) | Support ordering | `bool` | `false` | no |
| <a name="input_use_namespace_id"></a> [use\_namespace\_id](#input\_use\_namespace\_id) | When true, use namespace\_id for the topic resource instead of namespace\_name (required when namespace\_id is passed). | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | name of the topic |
| <a name="output_primary_send_and_listen_connection_string"></a> [primary\_send\_and\_listen\_connection\_string](#output\_primary\_send\_and\_listen\_connection\_string) | primary connection string for send and listen operations |
| <a name="output_primary_send_and_listen_shared_access_key"></a> [primary\_send\_and\_listen\_shared\_access\_key](#output\_primary\_send\_and\_listen\_shared\_access\_key) | primary shared access key with send and listen rights |
| <a name="output_secondary_send_and_listen_connection_string"></a> [secondary\_send\_and\_listen\_connection\_string](#output\_secondary\_send\_and\_listen\_connection\_string) | secondary connection string for send and listen operations |
| <a name="output_secondary_send_and_listen_shared_access_key"></a> [secondary\_send\_and\_listen\_shared\_access\_key](#output\_secondary\_send\_and\_listen\_shared\_access\_key) | secondary shared access key with send and listen rights |
| <a name="output_topic_id"></a> [topic\_id](#output\_topic\_id) | Azure resource ID of the topic |
<!-- END_TF_DOCS -->