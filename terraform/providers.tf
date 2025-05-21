provider "aws" {
  alias  = "moe-root"
  region = "eu-west-2"
  profile = var.master_profile
}


provider "aws" {
  alias  = "moe-root2"
  region = "eu-west-2"
  profile = "moe-root2"
}
