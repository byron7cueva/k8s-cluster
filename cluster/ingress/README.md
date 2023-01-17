## Documentation

https://kubernetes.github.io/ingress-nginx/deploy/

## Install
helm upgrade --install ingress-nginx ingress-nginx   --repo https://kubernetes.github.io/ingress-nginx   --namespace ingress-nginx --create-namespace

## Test
kubectl create deployment demo --image=httpd --port=80
kubectl expose deployment demo
kubectl create ingress demo-localhost --class=nginx   --rule="demo.localdev.me/*=demo:80"
kubectl get service ingress-nginx-controller --namespace=ingress-nginx