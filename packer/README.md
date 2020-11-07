# Packer 

The AMI is built on top of Ubuntu, has Node.js application installed, and contains the code from the [nodejs-hello-world](https://github.com/Ksreenivas/nodejs-application/tree/main/nodejs-hello-world) folder.

* Website: https://www.packer.io
* IRC: `#packer-tool` on Freenode
* Mailing list: [Google Groups](https://groups.google.com/forum/#!forum/packer-tool)

## Documentation

Comprehensive documentation is viewable on the Packer website:

https://www.packer.io/docs

## Quick start

1. Install [Packer](https://www.packer.io/).
2. Export your AWS credentials as the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.
```
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXX

export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

export AWS_DEFAULT_REGION="us-east-1"
```
3. Clone the Packer repo `git clone https://github.com/Ksreenivas/nodejs-application.git` 
```
cd nodejs-application\packer\
```
4. The `packer validate` Packer command is used to validate the syntax and configuration of a template.
```
$ packer validate hello-world.json
```
5. The `packer inspect` command takes a template and outputs the various components a template defines.
```
$ packer inspect hello-world.json
Packer Inspect: JSON mode
Optional variables and their defaults:

  region = us-east-1

Builders:

  amazon-ebs

Provisioners:

  shell
  file
  shell
  shell

Note: If your build names contain user variables or template
functions such as 'timestamp', these are processed at build time,
and therefore only show in their raw form here.
```
6. Next, tell Packer to build the image:

```
$ packer build hello-world.json

amazon-ebs: output will be in this color.
Build 'amazon-ebs' finished after 10 minutes 1 second.

==> Wait completed after 10 minutes 1 second

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:
us-east-1: ami-05485d47014e7afb4
```
7. Packer register the AMI into respective AWS Account.

## Jenkinsfile

Pipeline has been created with stages set to create
1. Validate, Inspect, Build packer image. (Stage 1)
2. Deploy `Node.js` web application from [Terraform](https://github.com/Ksreenivas/nodejs-application/tree/main/terraform) folder using `make init`, `make plan`, `make apply` commands.