#!/bin/bash

kubectl create secret generic db-secret \
  --from-literal=username=admin \
  --from-literal=password=StrongPassword123 \
  -n prod
