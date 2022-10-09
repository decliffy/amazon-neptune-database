variable "trusted_role_arn" {
  type        = string
  description = "Service principal"
  default     = "rds.amazonaws.com"
  sensitive   = false
}

variable "role_name" {
  default     = "neptunes3role"
  type        = string
  description = "Neptune S3 Bucket role"
}

variable "policy_arns" {
  default     = ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
  type        = list(string)
  description = "List of ARNs of policies to be associated with the created IAM role"
}