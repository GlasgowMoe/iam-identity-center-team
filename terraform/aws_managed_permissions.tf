module "permissions_ReadOnlyAccess" {
  source             = "./modules/permission-set"
  providers          = {
    aws = aws.moe-root2
  }
  permission_set_name         = "ReadOnlyAccess"
  permission_set_description  = "ReadOnlyAccess"
  session_duration            = "PT1H"
  relay_state                 = "https://eu-west-2.console.aws.amazon.com/"
  managed_policy_arn          = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  depends_on                  = [module.identity_center_delegation] # This is needed to ensure the delegation is created before the permission set

}







