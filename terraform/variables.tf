variable "master_profile" {
  description = "Master Account"
  type        = string
  default     = "moe-root"
}

variable "region" {
  description = "The AWS region to deploy the permission set."
  type        = string  
  default     = "eu-west-2"
  
}
