# Troubleshooting

## Pods not starting
kubectl describe pod <pod>

## ImagePullBackOff
Check ECR auth & image tag

## ArgoCD sync issues
argocd app get java-app-green
