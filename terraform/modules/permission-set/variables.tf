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

variable "create_inline_policy" {
  description = "Whether to create the inline policy for the permission set"
  type        = bool
  default     = false
}

variable "create_cusomter_policy" {
  description = "Whether to create the customer managed policy for the permission set"
  type        = bool
  default     = false 
  
}

variable "aws_iam_policy_document" {
  description = "The IAM policy document to use for the inline policy."
  type        = any
  default     = null
}

variable "customer_managed_policy_name" {
  description = "The name of the customer managed policy to attach to the permission set."
  type        = any
  default     = ""
}
variable "customer_managed_policy_path" {
  description = "The path of the customer managed policy to attach to the permission set."
  type        = any
  default     = null
}

variable "policy_name" {
  description = "The name of the IAM policy."
  type        = string
  default     = "CustomPolicy"
}
variable "policy_description" {
  description = "The description of the IAM policy."
  type        = string
  default     = "Custom policy for permission set"
}
variable "policy_document" {
  description = "The policy document for the IAM policy."
  type        = string
  default     = "{}"
}
