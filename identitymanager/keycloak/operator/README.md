# Keycloak

Documentación:

https://www.keycloak.org/operator/installation

## Create namespace

´´´shell
 kubectl create namespace keycloak
 kubectl create -f db-secrect.yaml
 kubectl create -f cluster.yml
´´´

## Install Operator

´´´shell
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/20.0.2/kubernetes/keycloaks.k8s.keycloak.org-v1.yml
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/20.0.2/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/20.0.2/kubernetes/kubernetes.yml -n keycloak
´´´