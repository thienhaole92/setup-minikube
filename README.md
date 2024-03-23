# setup-minikube

`setup-minikube` is a short script to install minikube for local Kubernetes development and testing on `MacOS`. I feel like I have to automate this after installing minikube for a few times.

## Getting Started

1. Assign execute permission to `install-minikube.sh` file

```sh
chmod +x install-minikube.sh
```

2. Run the script.

```sh
./install-minikube.sh
```

3. Access ArgoCD web UI

To access the ArgoCD web UI, you'll need to port forward to the argocd-server service

```sh
kubectl port-forward svc/argocd-server -n argocd 8080:80
```

4. Create database resources

```sh
kubectl apply -f ./local/resources/postgres.yaml
```

5. Connect to PostgreSQL

Getting the NodePort using the service command

```sh
minikube service postgres --url -n local
```

You will see minikube IP and a service's NodePort as below

```sh
❯ minikube service postgres -n local
|-----------|----------|-------------|---------------------------|
| NAMESPACE |   NAME   | TARGET PORT |            URL            |
|-----------|----------|-------------|---------------------------|
| local     | postgres |        5432 | http://192.168.49.2:30432 |
|-----------|----------|-------------|---------------------------|
🏃  Starting tunnel for service postgres.
|-----------|----------|-------------|------------------------|
| NAMESPACE |   NAME   | TARGET PORT |          URL           |
|-----------|----------|-------------|------------------------|
| local     | postgres |             | http://127.0.0.1:60700 |
|-----------|----------|-------------|------------------------|
🎉  Opening service local/postgres in default browser...
❗  Because you are using a Docker driver on darwin, the terminal needs to be open to run it.
```

6. Create database using terraform

```sh
terraform -chdir=./local/terraform/postgres init -var="host=127.0.0.1" -var="port=60700" -var="user=postgres" -var="password=password"

terraform -chdir=./local/terraform/postgres apply --auto-approve -var="host=127.0.0.1" -var="port=60700" -var="user=postgres" -var="password=password"
```
