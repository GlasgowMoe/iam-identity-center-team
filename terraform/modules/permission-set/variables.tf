variable "region" {
  description = "The AWS region to deploy the permission set."
  type        = string  
  default     = "eu-west-2"
  
}

variable "permission_set_name" {
  description = "The name of the permission set."
  type        = string
  default     = "ReadOnlyAccess"
}

variable "permission_set_description" {
  description = "The description of the permission set."
  type        = string
  default     = "ReadOnlyAccess"
}
variable "session_duration" {
  description = "The duration of the session for the permission set."
  type        = string
  default     = "PT1H"
}
variable "relay_state" {
  description = "The relay state for the permission set."
  type        = string
  default     = "https://eu-west-2.console.aws.amazon.com/"
}
variable "tags" {
  description = "Tags to apply to the permission set."
  type        = map(string)
  default     = {
    DeployedBy = "Terraform"
  }
}

variable "managed_policy_arn" {
  description = "The ARN of the managed policy to attach to the permission set."
  type        = string
}
# variable "target_account_id" {
#   description = "The target account ID for the permission set."
#   type        = string
#   default     = "626635440741"
# }
# variable "target_account_name" {
#   description = "The target account name for the permission set."
#   type        = string
#   default     = "MOE-Account"
# }
# variable "target_account_alias" {
#   description = "The target account alias for the permission set."
#   type        = string
#   default     = "MOE-Account"
# }       