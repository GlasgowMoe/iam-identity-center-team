##########################################################################
# Permission sets for AWS Identity Center
### EXAMPLE of permission set with customer managed policy, Polices are defined in the polices folder. Each file should contain a valid IAM policy document in JSON format.
##########################################################################
module "permissions_PowerUserAccess" {
  source             = "./modules/permission-set"
  providers          = {
    aws = aws.moe-root2
  }
  permission_set_name          = "PowerUserAccess"
  permission_set_description   = "PowerUserAccess"
  session_duration             = "PT1H"
  relay_state                  = "https://eu-west-2.console.aws.amazon.com/"
  managed_policy_arn           = "arn:aws:iam::aws:policy/PowerUserAccess"
  depends_on                   = [module.identity_center_delegation] # This is needed to ensure the delegation is created before the permission set
  create_cusomter_policy       = true
  customer_managed_policy_path = "/"
  policy_description           = "My test policy"
  policy_document              = file("aws_customer_polices/ec2-describe-policy.json")
  policy_name                  = "ec2-describe-policy"
}