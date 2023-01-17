## Documentation

https://metallb.universe.tf/installation/#installation-with-helm
https://metallb.universe.tf/configuration/#layer-2-configuration
https://kubernetes.github.io/ingress-nginx/deploy/baremetal/#a-pure-software-solution-metallb

## Add repository

helm repo add metallb https://metallb.github.io/metallb
helm repo update

## Install

kubectl create namespace metallb-system
helm install metallb metallb/metallb -n metallb-system

## Configuration

kubectl create -f ip-pool.yml
kubectl create -f l2.yml