terraform {
  required_version = ">= 0.12.26"

  # Configure the Terraform backend
  backend "s3" {
    # Make sure you have S3 Bucket created in the respective region!
    bucket = "infrastructure-as-code-nodejs"
    region = "us-east-1"
    key    = "terraform.tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Get the Ubuntu AMI-ID created via packer
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["240253503015"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
# I have this AMI created already via packer - ami-05485d47014e7afb4 (private)
  filter {
    name   = "name"
    values = ["nodejs-2020-11-07*"]
  }
}

# Here we send values to nodejs_module to create ec2 and security group.

module "nodejs_application" {
  # Provide local file system path or git url and specific branch or git url with specific version
  source = "./nodejs-module"

  # Pass parameters to the module
  name          = "Node.js web application"
  port          = 8080
  ami           = data.aws_ami.ubuntu.image_id
  key_pair_name = var.key_pair_name
}
