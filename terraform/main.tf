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


resource "null_resource" "run_init_script" {
  provisioner "local-exec" {
    command = "bash init.sh"
    working_dir = "../installtion/deployment/"
    when = create
  }
    triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "run_deploy_script" {
  provisioner "local-exec" {
    command = "bash deploy.sh"
    working_dir = "../installtion/deployment/"
    when = create
  }
    triggers = {
    always_run = "${timestamp()}"
  }
  depends_on = [ null_resource.run_init_script ]
}

resource "null_resource" "wait_1_minutes" {
  provisioner "local-exec" {
    command = "sleep 1" # 20 minutes = 1200 seconds
  }
  depends_on = [ null_resource.run_deploy_script ]
  triggers = {
    always_run = timestamp()
  }
}


resource "null_resource" "run_integration_script" {
  provisioner "local-exec" {
    command = "bash integration.sh"
    working_dir = "../installtion/deployment/"
  }
  depends_on = [ null_resource.wait_1_minutes]
  triggers = {
    always_run = timestamp()
  }
}


#manual steps
#1. Once the above code has ran, Setup AWS TEAM APP in IDC and copy the SAML metadata URL
#2. update the copied metadata URL details.json file under deplyoment folder and run cognito.sh
#3 Add Team Groups to the AWS TEAM APP in IDC



### SSO APP - API does not support creating SAML 2.0 customer managed applications or Amazon Web Services managed applications. q