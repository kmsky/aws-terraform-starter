init:
	terraform init

plan:
	terraform plan

apply:
	terraform init
	terraform apply -auto-approve