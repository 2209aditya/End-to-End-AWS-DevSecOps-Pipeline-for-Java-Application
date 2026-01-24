# Architecture Overview

## High-Level Flow
Developer → GitHub → CI (CodeBuild/Jenkins) → ECR → ArgoCD → EKS

## Components
- AWS EKS (Kubernetes)
- ECR (Container Registry)
- ArgoCD (GitOps CD)
- Helm (Application Packaging)
- Prometheus & Grafana (Monitoring)

## Security
- Non-root containers
- Image scanning (Trivy)
- Static code analysis (SonarQube)
- GitOps-based deployments

## Deployment Strategy
- Blue-Green using ArgoCD
