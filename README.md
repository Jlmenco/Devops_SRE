## Gerar imagem

```bash
docker build -t jlmenco/sre_app:latest .
```

## Deploy especificando namespace

```bash
kubectl create namespace sre
kubectl -n sre get namespaces
kubectl -n sre apply -f k8s/deployment.yaml
kubectl -n sre get deployments.apps
kubectl -n sre get pods
kubectl -n sre port-forward api-dd5c59f57-dx4j5 3000:3000
kubectl -n sre delete -f k8s/deployment.yaml
kubectl delete namespace sre
```

## Deploy namespace `default`

```bash
kubectl get namespaces
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/deployment-2.yaml
kubectl get deployments.apps
kubectl get pods
kubectl port-forward api-dd5c59f57-dx4j5 3000:3000
```