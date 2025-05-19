### Mgmt Delegation
module "identity_center_delegation" {
  source             = "./modules/identity-center-delegation"
  providers          = {
    aws = aws.moe-root
  }
  target_account_id = "626635440741" # <-- Replace with your member account ID
}


#Datastore required for the events sent by AWS TEAM
resource "aws_cloudtrail_event_data_store" "team_lake_datastore" {
  provider = aws.moe-root2
  name = "team-lake-datastore3"
}


### Session duriation 
### Identity Source
### Codecommit
### Permission Sets
### SSO APP
