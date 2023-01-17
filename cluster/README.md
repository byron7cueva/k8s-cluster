## Install

´´´shell
# Master
curl -sfL get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server --disable traefik --flannel-backend host-gw --write-kubeconfig=/home/bcueva/.kube/config --node-name master" sh -s -
# Get Token
sudo cat /var/lib/rancher/k3s/server/node-token

# Worker
curl -sfL https://get.k3s.io | K3S_NODE_NAME=worker1 K3S_URL=https://192.168.1.122:6443 K3S_TOKEN=<TOKEN> sh -
´´´

## Labels

´´´shell
kubectl label nodes worker1 nodegroup-type=applications node-role.kubernetes.io/worker=worker
kubectl label nodes worker2 nodegroup-type=tools node-role.kubernetes.io/worker=worker
´´´


## Networking tools

´´´shell
kubectl create namespace tools
kubectl create deployment multitool --image=praqma/network-multitool -n tools
´´´