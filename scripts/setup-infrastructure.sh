#!/bin/bash
set -e

echo "Initializing Terraform"
cd infrastructure/terraform
terraform init
terraform apply -auto-approve
