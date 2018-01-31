# ARM template for Service Bus topic
data "template_file" "topic_template" {
  template = "${file("${path.module}/template/topic_template.json")}"
}

# Create Azure Service Bus topic
resource "azurerm_template_deployment" "topic" {
  template_body       = "${data.template_file.topic_template.rendered}"
  name                = "${var.name}"
  deployment_mode     = "Incremental"
  resource_group_name = "${var.resource_group_name}"

  parameters = {
    serviceBusNamespaceName     = "${var.namespace_name}"
    serviceBusTopicName         = "${var.name}"
  }
}
