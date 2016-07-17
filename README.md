Terraform AWS CloudWatch Log Metric Filter Module
===========

A Terraform module to create a CloudWatch Log Metric Filter resource

Input Variables
---------------

- `name` - (Mandatory) A name for the metric filter
- `pattern` - (Mandatory) A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events
- `log_group_name` - (Mandatory) The name of the log group to associate the metric filter with
- `metric_transformation_name` - (Mandatory) The name of the CloudWatch metric to which the monitored log information should be published (e.g. ErrorCount)
- `metric_transformation_namespace` - (Mandatory) The destination namespace of the CloudWatch metric
- `metric_transformation_value` - (Mandatory) What to publish to the metric. For example, if you're counting the occurrences of a particular term like "Error", the value will be "1" for each occurrence. If you're counting the bytes transferred the published value will be the value in the log event

Output Variables
----------------

None

Usage
-----

```
variable "name" { default = "SignInWithoutMFA" }
variable "pattern" { default = "{ $.userIdentity.sessionContext.attributes.mfaAuthenticated != "true" }" }
variable "log_group_name" { default = "${aws_cloudwatch_log_group.cloudwatch_lg.name}" }
variable "metric_transformation_name" { default = "${var.name}" }
variable "metric_transformation_namespace" { default = "Namespace" }
variable "metric_transformation_value" { default = "1" }

module "my_cloudwatch_lmf" {
  source = "github.com/mambetica/tf_aws_cloudwatch_lmf"
  name = "${var.name}"
  pattern = "${var.pattern}"
  log_group_name = "${var.log_group_name}"
  metric_transformation_name = "${var.metric_transformation_name}"
  metric_transformation_namespace = "${var.metric_transformation_namespace}"
  metric_transformation_value = "${var.metric_transformation_value}"
}
```
