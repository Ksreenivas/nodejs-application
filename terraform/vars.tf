# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

variable "key_pair_name" {
  description = "The name of a Key Pair that you will be able to use this Key Pair to SSH to the EC2 instance."
  type        = string
  default     = "sowmya"
}
