##########################################################################
### EXAMPLE of permission set with inline policy, Polices are defined in the polices folder. Each file should contain a valid IAM policy document in JSON format.
##########################################################################
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
  depends_on                  = [module.identity_center_delegation] # This is needed to ensure the delegation is created before the permission set
  create_inline_policy        = true 
  aws_iam_policy_document     = file("aws_inline_polices/inline.json")
  
  #data.aws_iam_policy_document.example.json
}
