resource "aws_servicecatalog_organizations_access" "example" {
  enabled = "true"
}
resource "aws_organizations_delegated_administrator" "this" {
  account_id        = var.target_account_id
  service_principal = "sso.amazonaws.com"
}