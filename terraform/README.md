# Terraform

This folder contains Infrastructure as a code to bring up EC2 instance with [user-data](https://github.com/Ksreenivas/nodejs-application/blob/main/terraform/nodejs-module/user-data.sh) to bring up node.js applicaiton container and security group with port `8080` to access node.js web application.

## Quick start

This folder creates real AWS resources in to your account, These resources are created using [AWS-free-tier](https://aws.amazon.com/free/)

### prerequisite
```
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXX

export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

export AWS_DEFAULT_REGION="us-east-1"
```

1. Install [Terraform](https://www.terraform.io/).
2. Execute `make init`
3. Execute `make get`
4. Execute `make plan`
5. Execute `make apply` (terraform remote state will be stored in the s3 bucket)
 
## Destroy Resources

- Execute `make destroy` - This will clean up all the resources inside your AWS account.
