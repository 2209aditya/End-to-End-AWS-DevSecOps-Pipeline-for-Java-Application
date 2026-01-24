#!/bin/bash

echo "Deleting application and infra"
kubectl delete namespace prod argocd --ignore-not-found
cd infrastructure/terraform && terraform destroy -auto-approve
