data "aws_ssoadmin_instances" "primary" {}

resource "aws_ssoadmin_application" "custom_saml" {
  name                     = var.application_name
  description              = var.application_description
  application_provider_arn = "arn:aws:sso::aws:applicationProvider/custom"
  instance_arn             = tolist(data.aws_ssoadmin_instances.primary.arns)[0]
}

resource "aws_ssoadmin_application_assignment_configuration" "this" {
  application_arn     = aws_ssoadmin_application.custom_saml.application_arn
  assignment_required = true
}

# resource "aws_ssoadmin_application_assignment" "group_assignment" {
#   application_arn = aws_ssoadmin_application.custom_saml.application_arn
#   principal_id    = aws_identitystore_group.default.group_id
#   principal_type  = "GROUP"
# }