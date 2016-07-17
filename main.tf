resource "aws_cloudwatch_log_metric_filter" "couldwatch_lmf" {
  name = "${var.name}"
  pattern = "${var.pattern}"
  log_group_name = "${var.log_group_name}"
  metric_transformation {
    name = "${var.metric_transformation_name}"
    namespace = "${var.metric_transformation_namespace}"
    value = "${var.metric_transformation_value}"
  }
}