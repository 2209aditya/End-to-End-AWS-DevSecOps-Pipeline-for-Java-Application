# Deployment Guide

## Prerequisites
- AWS CLI
- kubectl
- helm
- Terraform

## Steps
1. Provision infra using Terraform
2. Build & push image to ECR
3. Deploy ArgoCD
4. Sync application using GitOps

## Validation
- kubectl get pods -n prod
- Access service via Ingress/ALB
