#!/bin/bash

cd "$(dirname "$0")"

microk8s kubectl create namespace overleaf

microk8s helm repo add bitnami https://charts.bitnami.com/bitnami
microk8s helm search repo bitnami

microk8s helm install mongo bitnami/mongodb --namespace overleaf --values ./mongo/values.yaml
microk8s helm install redis bitnami/redis --namespace overleaf --values ./redis/values.yaml

microk8s enable ingress

# The PVs are straightforward, 
# with two providing 5Gi each and one offering 10Gi, 
# all limited to single-node read-write access. 
# They use the hostPath type, 
# which is convenient for testing but not ideal for production
#  due to its lack of redundancy and portability.

microk8s kubectl apply -f overleaf-storageclass.yaml

microk8s kubectl apply -f overleaf-pv.yaml

## If you need to support HTTPS access, please obtain a certificate and place the necessary files under lskeys folder.
# microk8s kubectl create secret tls overleaf-tls-secret \
#   --cert=/tlskeys/public.crt \
#   --key=/tlskeys/private.key \
#   --namespace=overleaf
# microk8s kubectl apply -f tls-ingress.yaml

microk8s kubectl apply -n overleaf -f ./overleaf/overleaf-pvc.yaml -f ./overleaf/overleaf-variables.yaml -f ./overleaf/overleaf-deployment.yaml -f ./overleaf/overleaf-service.yaml

## Uncomment following ling to expose the application via ingress
#kubectl apply -n overleaf -f ./overleaf/overleaf-ingress.yaml