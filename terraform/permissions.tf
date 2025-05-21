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

}


module "permissions_PowerUserAccess" {
  source             = "./modules/permission-set"
  providers          = {
    aws = aws.moe-root2
  }
  permission_set_name         = "PowerUserAccess"
  permission_set_description  = "PowerUserAccess"
  session_duration            = "PT1H"
  relay_state                 = "https://eu-west-2.console.aws.amazon.com/"
  managed_policy_arn          = "arn:aws:iam::aws:policy/PowerUserAccess"

}

module "permissions_AdministratorAccess" {
  source             = "./modules/permission-set"
  providers          = {
    aws = aws.moe-root2
  }
  permission_set_name         = "AdministratorAccess"
  permission_set_description  = "AdministratorAccess"
  session_duration            = "PT1H"
  relay_state                 = "https://eu-west-2.console.aws.amazon.com/"
  managed_policy_arn          = "arn:aws:iam::aws:policy/AdministratorAccess"

}
