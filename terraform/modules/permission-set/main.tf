
data "aws_ssoadmin_instances" "default" {}

resource "aws_ssoadmin_permission_set" "this" {
  name             = var.permission_set_name
  description      = var.permission_set_description
  instance_arn     = data.aws_ssoadmin_instances.default.arns[0]
  session_duration = var.session_duration != null ? var.session_duration : "PT1H"
  relay_state      = var.relay_state != null ? var.relay_state : "https://eu-west-2.console.aws.amazon.com/"
  tags             = var.tags != null ? var.tags : var.tags
}

resource "aws_ssoadmin_managed_policy_attachment" "this" {
  instance_arn       = data.aws_ssoadmin_instances.default.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  managed_policy_arn = var.managed_policy_arn
}
