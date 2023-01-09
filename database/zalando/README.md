## Documentation

https://postgres-operator.readthedocs.io/en/latest/
cre
https://github.com/zalando/postgres-operator/blob/master/docs/quickstart.md

## Add repository

```shell
export ZALANDO_BASE=https://raw.githubusercontent.com/zalando/postgres-operator
helm repo add zalando-pg $ZALANDO_BASE/master/charts/postgres-operator/
helm repo add zalando-ui $ZALANDO_BASE/master/charts/postgres-operator-ui/
helm repo update
```

## Install operator

```shell
helm upgrade -i \
  --create-namespace -n postgres \
  --set env.TZ="America/Guayaquil" \
  -f values.yaml \
  pg-operator \
  zalando-pg/postgres-operator
```

## Validate installation

```shell
kubectl --namespace=postgres get pods -l "app.kubernetes.io/name=postgres-operator"
```

## Uninstall operator

```shell
helm uninstall pg-operator -n postgres
```

## Cluster Postgresql

### Create cluster

```shell
#chown 1000:1000 -R /home/k8s/volumes/keycloak/themes/

sudo chown 777 -R /run/media/byron/Vm/nfs/postgresql/instance1
# Create
kubectl create -f cluster.yaml

oc adm policy add-scc-to-user anyuid -z pg-operator-postgres-operator  -n postgres
oc adm policy add-scc-to-user anyuid -z postgres-pod  -n postgres

# check the deployed cluster
kubectl get postgresql -n postgres

# check created database pods
kubectl get pods -l application=spilo -L spilo-role -n postgres


      serviceAccount: pg-operator-postgres-operator


# check created service resources
kubectl get svc -l application=spilo -L spilo-role -n postgres

kubectl get secret -n postgres
oc get secret postgres.postgres-cluster.credentials.postgresql.acid.zalan.do -n postgres -o 'jsonpath={.data.password}' |  base64 -d
```

### Delete cluster

```shell
kubectl delete -f cluster.yaml
```
