
data "aws_ssoadmin_instances" "default" {}

#### Permission Set Creation
resource "aws_ssoadmin_permission_set" "this" {
  name             = var.permission_set_name
  description      = var.permission_set_description
  instance_arn     = data.aws_ssoadmin_instances.default.arns[0]
  session_duration = var.session_duration != null ? var.session_duration : "PT1H"
  relay_state      = var.relay_state != null ? var.relay_state : "https://eu-west-2.console.aws.amazon.com/"
  tags             = var.tags != null ? var.tags : var.tags
}



############## Managed Policy Attachment
resource "aws_ssoadmin_managed_policy_attachment" "this" {
  instance_arn       = data.aws_ssoadmin_instances.default.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  managed_policy_arn = var.managed_policy_arn
}


resource "aws_ssoadmin_permission_set_inline_policy" "this" {
  count              = var.create_inline_policy ? 1 : 0
  inline_policy      = var.aws_iam_policy_document
  instance_arn       = data.aws_ssoadmin_instances.default.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
}



############# Customer Managed Policy Attachment
resource "aws_ssoadmin_customer_managed_policy_attachment" "this" {
  count              = var.create_cusomter_policy ? 1 : 0
  instance_arn       = data.aws_ssoadmin_instances.default.arns[0]
  permission_set_arn = aws_ssoadmin_permission_set.this.arn
  customer_managed_policy_reference {
    name = var.policy_name
    path = var.customer_managed_policy_path != null ? var.customer_managed_policy_path : "/"
  }
  
}

resource "aws_iam_policy" "this" {
  count       = var.create_cusomter_policy ? 1 : 0
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy_document
}
