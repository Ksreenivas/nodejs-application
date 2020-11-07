variable "name" {
  description = "The name used to namespace resources created by this module"
  type        = string
}

variable "ami" {
  description = "The ami_id of the ubuntu machine which has node.js app code and docker image created"
  type        = string
}

variable "key_pair_name" {
  description = "The name of a Key Pair that you will be able to use this Key Pair to SSH to the EC2 instance."
  type        = string
}

variable "port" {
  description = "The port the  Node.js app should listen on for HTTP requests"
  type        = number
}
