.PHONY: all plan apply destroy

all: help

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'

help:						## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

get:		terraform-pre-validation 		## Get the terraform modules
	terraform get

init:		terraform-pre-validation		## Initialize remote S3 backend.
	terraform init

plan:		terraform-pre-validation		## Plan the changes to infra.
	terraform plan

refresh:	terraform-pre-validation		## Refresh the remote state with existing AWS infra.
	terraform refresh

apply:		terraform-pre-validation		## Apply the changes in plan.
	terraform apply

output:		terraform-pre-validation		## See the output.
	terraform output -json

destroy:	terraform-pre-validation		## Destroy the infra.
	terraform destroy

terraform-pre-validation:
ifndef AWS_ACCESS_KEY_ID
	$(error AWS_ACCESS_KEY_ID is not defined.)
endif
ifndef AWS_SECRET_ACCESS_KEY
	$(error AWS_SECRET_ACCESS_KEY is not defined.)
endif
ifndef AWS_DEFAULT_REGION
	$(error AWS_DEFAULT_REGION is not defined.)
endif