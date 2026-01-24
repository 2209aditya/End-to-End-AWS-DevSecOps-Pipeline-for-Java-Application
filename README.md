# 🚀 End-to-End AWS DevSecOps Pipeline for Java Application

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazon-aws)
![Java](https://img.shields.io/badge/Java-17-red?style=for-the-badge&logo=java)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2-green?style=for-the-badge&logo=spring-boot)
![Docker](https://img.shields.io/badge/Docker-Container-blue?style=for-the-badge&logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=for-the-badge&logo=kubernetes)

> A production-ready, enterprise-grade CI/CD pipeline featuring comprehensive security scanning, automated testing, and zero-downtime blue-green deployments on AWS infrastructure.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Repository Structure](#-repository-structure)
- [Setup Guide](#-setup-guide)
- [Pipeline Stages](#-pipeline-stages)
- [Blue-Green Deployment](#-blue-green-deployment)
- [Security](#-security)
- [Monitoring](#-monitoring)
- [Troubleshooting](#-troubleshooting)
- [Best Practices](#-best-practices)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

This project demonstrates a complete DevSecOps implementation for a Java Spring Boot application using AWS native services and industry-standard tools. The pipeline automates everything from code commit to production deployment with comprehensive security scanning at every stage.

### Why This Pipeline?

- **🔒 Security First**: Multiple security scanning tools integrated at every stage
- **⚡ Zero Downtime**: Blue-green deployment strategy ensures seamless releases
- **🔄 GitOps Ready**: Declarative infrastructure and application management
- **📊 Observable**: Built-in monitoring and logging with AWS CloudWatch and Prometheus
- **♻️ Repeatable**: Infrastructure as Code with Terraform/CloudFormation
- **🎯 Production Ready**: Enterprise-grade best practices and patterns

---

## 🏗 Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                           DEVELOPER                                  │
│                     (Push Code to GitHub)                           │
└──────────────────────────┬──────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    AWS CODEPIPELINE (CI/CD)                          │
│  ┌────────────────────────────────────────────────────────────┐    │
│  │                   AWS CODEBUILD                             │    │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐    │    │
│  │  │ Build & Test │→ │  SonarQube   │→ │ OWASP Check  │    │    │
│  │  └──────────────┘  └──────────────┘  └──────────────┘    │    │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐    │    │
│  │  │ Docker Build │→ │ Trivy Scan   │→ │  Push to ECR │    │    │
│  │  └──────────────┘  └──────────────┘  └──────────────┘    │    │
│  │  ┌──────────────┐  ┌──────────────┐                       │    │
│  │  │  Helm Chart  │→ │ Update GitOps│                       │    │
│  │  └──────────────┘  └──────────────┘                       │    │
│  └────────────────────────────────────────────────────────────┘    │
└──────────────────────────┬──────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         ARGOCD                                       │
│              (Monitors GitOps Repository)                           │
│                    Running on EKS                                   │
└──────────────────────────┬──────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    AWS EKS CLUSTER                                   │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │              BLUE-GREEN DEPLOYMENT                             │ │
│  │                                                                 │ │
│  │  ┌─────────────────┐         ┌─────────────────┐             │ │
│  │  │  Blue (v1.0)    │         │  Green (v2.0)   │             │ │
│  │  │  ✅ Active      │    →    │  🟡 Standby     │             │ │
│  │  │  2 Pods         │         │  2 Pods         │             │ │
│  │  └─────────────────┘         └─────────────────┘             │ │
│  │           ↓                            ↓                       │ │
│  │  ┌─────────────────────────────────────────────┐             │ │
│  │  │     Application Load Balancer (ALB)         │             │ │
│  │  └─────────────────────────────────────────────┘             │ │
│  └───────────────────────────────────────────────────────────────┘ │
│                                                                      │
│  Data Tier: RDS PostgreSQL | Cache: ElastiCache | Files: EFS       │
└─────────────────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    MONITORING & LOGGING                              │
│  CloudWatch | X-Ray | Prometheus | Grafana | CloudTrail             │
└─────────────────────────────────────────────────────────────────────┘
```

---

## ✨ Features

### 🔐 Security Features
- ✅ **SonarQube** - Static code analysis and quality gates
- ✅ **Trivy** - Container vulnerability scanning
- ✅ **OWASP Dependency Check** - Dependency vulnerability analysis
- ✅ **Snyk** - Real-time security monitoring
- ✅ **AWS Secrets Manager** - Secure secret management
- ✅ **IAM Roles** - Least privilege access control
- ✅ **VPC Security Groups** - Network-level security
- ✅ **KMS Encryption** - Data encryption at rest and in transit

### 🚀 DevOps Features
- ✅ **AWS CodePipeline** - Fully automated CI/CD
- ✅ **AWS CodeBuild** - Managed build service
- ✅ **Amazon ECR** - Secure container registry
- ✅ **Amazon EKS** - Managed Kubernetes service
- ✅ **Helm Charts** - Kubernetes package management
- ✅ **ArgoCD** - GitOps continuous delivery
- ✅ **Blue-Green Deployment** - Zero downtime releases
- ✅ **Auto Scaling** - HPA and Cluster Autoscaler

### 📊 Observability
- ✅ **CloudWatch Logs** - Centralized logging
- ✅ **CloudWatch Metrics** - Performance monitoring
- ✅ **AWS X-Ray** - Distributed tracing
- ✅ **Container Insights** - EKS monitoring
- ✅ **Prometheus** - Metrics collection
- ✅ **Grafana** - Visualization dashboards
- ✅ **CloudTrail** - Audit logging

---

## 🛠 Tech Stack

### AWS Services
| Service | Purpose |
|---------|---------|
| **AWS CodePipeline** | Orchestrates the CI/CD workflow |
| **AWS CodeBuild** | Builds and tests the application |
| **Amazon ECR** | Stores Docker container images |
| **Amazon EKS** | Runs Kubernetes workloads |
| **AWS Secrets Manager** | Manages application secrets |
| **Amazon RDS** | PostgreSQL database |
| **Amazon ElastiCache** | Redis caching layer |
| **Amazon EFS** | Persistent file storage |
| **AWS CloudWatch** | Monitoring and logging |
| **AWS X-Ray** | Application tracing |
| **Amazon VPC** | Network isolation |
| **AWS IAM** | Identity and access management |
| **AWS KMS** | Encryption key management |
| **Elastic Load Balancing** | Application load balancer |
| **Amazon Route 53** | DNS management |

### Development Tools
- **Java 17** - Programming language
- **Spring Boot 3.2** - Application framework
- **Maven 3.9** - Build tool
- **Docker** - Containerization
- **Helm 3** - Kubernetes package manager
- **ArgoCD** - GitOps tool
- **SonarQube** - Code quality
- **Trivy** - Security scanner
- **OWASP Dependency Check** - Vulnerability scanner

---

## 📦 Prerequisites

### Required Tools
```bash
# AWS CLI
aws --version  # >= 2.x

# kubectl
kubectl version --client  # >= 1.28

# Helm
helm version  # >= 3.12

# Docker
docker --version  # >= 24.x

# Java & Maven
java -version  # Java 17
mvn -version   # Maven 3.9+

# eksctl (for EKS cluster management)
eksctl version  # >= 0.169.0

# Git
git --version  # >= 2.x
```

### AWS Account Requirements
- Active AWS Account with Administrator access
- AWS CLI configured with appropriate credentials
- Sufficient service quotas for:
  - EKS clusters
  - ECR repositories
  - VPC resources
  - Load balancers

### Cost Estimate
> **Note**: Running this infrastructure will incur AWS costs. Estimated monthly cost: **$200-400** depending on usage.

---

## 🚀 Quick Start

### 1️⃣ Clone Repository
```bash
git clone https://github.com/YOUR_USERNAME/aws-devsecops-java-app.git
cd aws-devsecops-java-app
```

### 2️⃣ Set Environment Variables
```bash
export AWS_REGION=us-east-1
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
export CLUSTER_NAME=eks-devsecops-prod
export ECR_REPO=java-app
```

### 3️⃣ Run Setup Script
```bash
chmod +x scripts/setup-infrastructure.sh
./scripts/setup-infrastructure.sh
```

### 4️⃣ Deploy Application
```bash
# Trigger pipeline
git add .
git commit -m "Initial deployment"
git push origin main
```

### 5️⃣ Access Application
```bash
# Get load balancer URL
kubectl get ingress -n prod
```

---

## 📁 Repository Structure

```
aws-devsecops-java-app/
│
├── 📂 src/                              # Java application source code
│   ├── main/
│   │   ├── java/
│   │   │   └── com/devsecops/app/
│   │   │       ├── Application.java
│   │   │       ├── controller/
│   │   │       ├── service/
│   │   │       ├── model/
│   │   │       └── config/
│   │   └── resources/
│   │       ├── application.yml
│   │       └── application-prod.yml
│   └── test/
│       └── java/
│           └── com/devsecops/app/
│
├── 📂 infrastructure/                   # Infrastructure as Code
│   ├── terraform/
│   │   ├── vpc/
│   │   ├── eks/
│   │   ├── rds/
│   │   └── ecr/
│   └── cloudformation/
│       ├── vpc-stack.yaml
│       └── eks-stack.yaml
│
├── 📂 helm/                             # Helm charts
│   └── java-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── values-blue.yaml
│       ├── values-green.yaml
│       └── templates/
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── ingress.yaml
│           ├── configmap.yaml
│           ├── secret.yaml
│           ├── hpa.yaml
│           ├── networkpolicy.yaml
│           └── serviceaccount.yaml
│
├── 📂 k8s-gitops/                       # GitOps manifests
│   ├── prod/
│   │   ├── blue/
│   │   │   └── values.yaml
│   │   └── green/
│   │       └── values.yaml
│   └── argocd/
│       ├── application-blue.yaml
│       ├── application-green.yaml
│       └── project.yaml
│
├── 📂 scripts/                          # Automation scripts
│   ├── setup-infrastructure.sh
│   ├── deploy-argocd.sh
│   ├── create-secrets.sh
│   └── cleanup.sh
│
├── 📂 monitoring/                       # Monitoring configuration
│   ├── prometheus/
│   │   └── values.yaml
│   └── grafana/
│       ├── values.yaml
│       └── dashboards/
│
├── 📂 docs/                             # Documentation
│   ├── ARCHITECTURE.md
│   ├── DEPLOYMENT.md
│   ├── SECURITY.md
│   └── TROUBLESHOOTING.md
│
├── 📄 pom.xml                           # Maven configuration
├── 📄 Dockerfile                        # Multi-stage Docker build
├── 📄 buildspec.yml                     # AWS CodeBuild specification
├── 📄 sonar-project.properties         # SonarQube configuration
├── 📄 .trivyignore                     # Trivy exceptions
├── 📄 docker-compose.yml               # Local development
└── 📄 README.md                        # This file
```

---

## 🔧 Setup Guide

### Step 1: Create VPC and Network Infrastructure

```bash
# Using Terraform
cd infrastructure/terraform/vpc
terraform init
terraform plan
terraform apply

# Or using AWS CLI
aws cloudformation create-stack \
  --stack-name devsecops-vpc \
  --template-body file://infrastructure/cloudformation/vpc-stack.yaml \
  --parameters ParameterKey=Environment,ParameterValue=prod
```

### Step 2: Create Amazon ECR Repository

```bash
# Create ECR repository
aws ecr create-repository \
  --repository-name java-app \
  --region $AWS_REGION \
  --encryption-configuration encryptionType=KMS

# Set lifecycle policy to retain only 10 images
aws ecr put-lifecycle-policy \
  --repository-name java-app \
  --lifecycle-policy-text file://scripts/ecr-lifecycle-policy.json
```

**ecr-lifecycle-policy.json**:
```json
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
```

### Step 3: Create Amazon EKS Cluster

```bash
# Create EKS cluster with eksctl
eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $AWS_REGION \
  --version 1.28 \
  --nodegroup-name standard-workers \
  --node-type t3.large \
  --nodes 3 \
  --nodes-min 2 \
  --nodes-max 5 \
  --managed \
  --enable-ssm \
  --alb-ingress-access \
  --asg-access

# Or use the provided configuration file
eksctl create cluster -f infrastructure/eks-cluster.yaml
```

**eks-cluster.yaml**:
```yaml
apiVersion: eksctl.io/v1alpha5
kind: ClusterConfig

metadata:
  name: eks-devsecops-prod
  region: us-east-1
  version: "1.28"

iam:
  withOIDC: true

managedNodeGroups:
  - name: standard-workers
    instanceType: t3.large
    minSize: 2
    maxSize: 5
    desiredCapacity: 3
    volumeSize: 50
    volumeType: gp3
    ssh:
      allow: false
    labels:
      role: worker
      environment: production
    tags:
      k8s.io/cluster-autoscaler/enabled: "true"
      k8s.io/cluster-autoscaler/eks-devsecops-prod: "owned"
    iam:
      attachPolicyARNs:
        - arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
        - arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
        - arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
        - arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy

addons:
  - name: vpc-cni
    version: latest
  - name: coredns
    version: latest
  - name: kube-proxy
    version: latest
  - name: aws-ebs-csi-driver
    version: latest

cloudWatch:
  clusterLogging:
    enableTypes: ["*"]
```

### Step 4: Configure kubectl Access

```bash
# Update kubeconfig
aws eks update-kubeconfig \
  --region $AWS_REGION \
  --name $CLUSTER_NAME

# Verify access
kubectl get nodes
kubectl get namespaces
```

### Step 5: Install Essential Add-ons

#### AWS Load Balancer Controller

```bash
# Download IAM policy
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json

# Create IAM policy
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam-policy.json

# Create IAM role
eksctl create iamserviceaccount \
  --cluster=$CLUSTER_NAME \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::$AWS_ACCOUNT_ID:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve

# Install controller via Helm
helm repo add eks https://aws.github.io/eks-charts
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=$CLUSTER_NAME \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller
```

#### Metrics Server

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

#### Cluster Autoscaler

```bash
# Create IAM policy for Cluster Autoscaler
aws iam create-policy \
  --policy-name AmazonEKSClusterAutoscalerPolicy \
  --policy-document file://scripts/cluster-autoscaler-policy.json

# Create service account
eksctl create iamserviceaccount \
  --cluster=$CLUSTER_NAME \
  --namespace=kube-system \
  --name=cluster-autoscaler \
  --attach-policy-arn=arn:aws:iam::$AWS_ACCOUNT_ID:policy/AmazonEKSClusterAutoscalerPolicy \
  --override-existing-serviceaccounts \
  --approve

# Deploy Cluster Autoscaler
kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

# Patch deployment with cluster name
kubectl -n kube-system annotate deployment.apps/cluster-autoscaler \
  cluster-autoscaler.kubernetes.io/safe-to-evict="false"

kubectl -n kube-system set image deployment.apps/cluster-autoscaler \
  cluster-autoscaler=registry.k8s.io/autoscaling/cluster-autoscaler:v1.28.0
```

### Step 6: Install ArgoCD

```bash
# Create namespace
kubectl create namespace argocd

# Install ArgoCD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Patch ArgoCD server for ALB
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# Get initial admin password
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d && echo

# Port forward for local access (optional)
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Install ArgoCD CLI
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```

### Step 7: Configure AWS Secrets Manager

```bash
# Create secret for database credentials
aws secretsmanager create-secret \
  --name prod/java-app/database \
  --secret-string '{
    "username": "appuser",
    "password": "SuperSecretPassword123!",
    "host": "mydb.cluster-xxx.us-east-1.rds.amazonaws.com",
    "port": "5432",
    "database": "appdb"
  }'

# Create secret for JWT token
aws secretsmanager create-secret \
  --name prod/java-app/jwt-secret \
  --secret-string '{"secret": "MyJWTSecretKey456!"}'

# Install AWS Secrets Manager CSI Driver
helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver \
  --namespace kube-system

# Install AWS Secrets and Configuration Provider
kubectl apply -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml
```

### Step 8: Create AWS CodePipeline

#### Create S3 Bucket for Artifacts

```bash
aws s3 mb s3://devsecops-pipeline-artifacts-$AWS_ACCOUNT_ID --region $AWS_REGION

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket devsecops-pipeline-artifacts-$AWS_ACCOUNT_ID \
  --versioning-configuration Status=Enabled

# Enable encryption
aws s3api put-bucket-encryption \
  --bucket devsecops-pipeline-artifacts-$AWS_ACCOUNT_ID \
  --server-side-encryption-configuration '{
    "Rules": [{
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }]
  }'
```

#### Create IAM Roles

**CodeBuild Service Role** (`scripts/codebuild-role.json`):
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

```bash
# Create CodeBuild role
aws iam create-role \
  --role-name CodeBuildServiceRole \
  --assume-role-policy-document file://scripts/codebuild-role.json

# Attach policies
aws iam attach-role-policy \
  --role-name CodeBuildServiceRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser

aws iam attach-role-policy \
  --role-name CodeBuildServiceRole \
  --policy-arn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess

aws iam attach-role-policy \
  --role-name CodeBuildServiceRole \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
```

#### Create CodePipeline

```bash
# Create pipeline using AWS CLI
aws codepipeline create-pipeline \
  --cli-input-json file://infrastructure/pipeline-config.json
```

**pipeline-config.json** (See full example in repository)

---

## 🔄 Pipeline Stages

### Stage 1: Source
**Trigger**: Git push to `main` or `develop` branch

- Fetches source code from GitHub
- Validates branch and commit
- Creates pipeline execution ID

**AWS Services**: CodePipeline, GitHub webhook

---

### Stage 2: Build & Test
**Duration**: ~5-8 minutes

#### Actions:
1. **Maven Build**
   ```bash
   mvn clean compile
   ```

2. **Unit Tests**
   ```bash
   mvn test
   ```

3. **Code Coverage**
   ```bash
   mvn jacoco:report
   ```
   - Target: >80% coverage
   - Fails pipeline if below threshold

4. **Package Application**
   ```bash
   mvn package -DskipTests
   ```

**Artifacts**: 
- `target/*.jar`
- `target/surefire-reports/*`
- `target/site/jacoco/*`

**buildspec.yml**:
```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      java: corretto17
    commands:
      - echo Installing dependencies...
      - apt-get update
      - apt-get install -y wget curl
      
  pre_build:
    commands:
      - echo Logging in to Amazon ECR...
      - aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
      
  build:
    commands:
      - echo Build started on `date`
      - echo Building the application...
      - mvn clean package -DskipTests=false
      - echo Build completed on `date`
      
  post_build:
    commands:
      - echo Generating reports...
      - mvn jacoco:report
      
artifacts:
  files:
    - target/*.jar
    - target/surefire-reports/**/*
    - target/site/jacoco/**/*
  name: BuildArtifact

reports:
  junit:
    files:
      - 'target/surefire-reports/TEST-*.xml'
  coverage:
    files:
      - 'target/site/jacoco/jacoco.xml'
    file-format: 'JACOCOXML'

cache:
  paths:
    - '/root/.m2/**/*'
```

---

### Stage 3: Code Quality Analysis
**Duration**: ~3-5 minutes

#### SonarQube Scan

**Configuration** (`sonar-project.properties`):
```properties
sonar.projectKey=aws-java-devsecops-app
sonar.projectName=AWS Java DevSecOps Application
sonar.projectVersion=1.0
sonar.sources=src/main/java
sonar.tests=src/test/java
sonar.java.binaries=target/classes
sonar.java.test.binaries=target/test-classes
sonar.junit.reportPaths=target/surefire-reports
sonar.jacoco.reportPaths=target/jacoco.exec
sonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml
sonar.language=java
sonar.sourceEncoding=UTF-8

# Quality Gate
sonar.qualitygate.wait=true
sonar.qualitygate.timeout=300

# Exclusions
sonar.exclusions=**/test/**,**/config/**
sonar.test.exclusions=**/test/**

# Thresholds
sonar.coverage.exclusions=**/config/**,**/model/**
```

**Quality Gates**:
- Code Coverage: ≥80%
- Maintainability Rating: A
- Reliability Rating: A
- Security Rating: A
- Duplicated Lines: <3%
- Code Smells: <10

**Execution**:
```bash
mvn sonar:sonar \
  -Dsonar.host.url=$SONAR_HOST_URL \
  -Dsonar.login=$SONAR_TOKEN
```

---

### Stage 4: Security Scanning
**Duration**: ~8-12 minutes

#### 4.1 OWASP Dependency Check

Scans Maven dependencies for known vulnerabilities.

```bash
mvn org.owasp:dependency-check-maven:check \
  -DfailBuildOnCVSS=7 \
  -DsuppressionFile=owasp-suppressions.xml
```

**Thresholds**:
- Critical: 0
- High: 0
- Medium: <5

#### 4.2 Trivy Filesystem Scan

```bash
trivy fs --severity HIGH,CRITICAL --exit-code 1 .
```

#### 4.3 Snyk Code Analysis

```bash
snyk test --severity-threshold=high
snyk code test
```

**Output**: Security report published to CodeBuild artifacts

---

### Stage 5: Docker Build & Scan
**Duration**: ~5-7 minutes

#### Multi-stage Dockerfile

```dockerfile
# Stage 1: Build
FROM public.ecr.aws/docker/library/maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app

# Copy dependency definitions
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source and build
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Runtime (Distroless for security)
FROM public.ecr.aws/distroless/java17-debian12:nonroot

# Metadata
LABEL maintainer="devops@company.com"
LABEL application="java-devsecops-app"
LABEL version
