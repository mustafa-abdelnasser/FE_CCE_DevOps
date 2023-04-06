#!/bin/bash
ARGOCD_GRPC_URL=`kubectl get ingresses -n argocd -o=jsonpath='{.items[?(@.metadata.name=="argocd-server-grpc")].spec.rules[*].host}'`

ARGOCD_USER="admin"

ARGOCD_PASSWORD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

echo "Connecting to grpc.argocd.fe.devops-labs.site as admin with default password"
argocd login $ARGOCD_GRPC_URL --username $ARGOCD_USER --password $ARGOCD_PASSWORD --insecure

echo "List current argocd projects"
argocd proj list
